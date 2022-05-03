class Budget < ApplicationRecord
  include ComputedAttribute

  belongs_to :campaign
  has_many :entries
  has_many :contributions, through: :entries
  has_many :disbursements, through: :entries

  computed_attribute(
    :total_contributions_cents,
    Entry
      .where('"entries"."budget_id" = "budgets"."id"')
      .with_contributions
      .select('SUM("entries"."amount_cents")'),
    proc { contributions.sum(&:amount_cents) }
  )

  computed_attribute(
    :total_contributions_currency,
    Entry
      .where('"entries"."budget_id" = "budgets"."id"')
      .with_contributions
      .limit(1)
      .select('"entries"."amount_currency"'),
    proc { contributions.first.amount_currency }
  )

  scope :selecting_total_contributions, -> { selecting_total_contributions_cents.selecting_total_contributions_currency }

  def total_contributions
    @total_contributions ||= Money.new(total_contributions_cents, total_contributions_currency)
  end

  computed_attribute(
    :total_disbursements_cents,
    Entry
      .where('"entries"."budget_id" = "budgets"."id"')
      .with_disbursements
      .select('-SUM("entries"."amount_cents")'),
    proc { disbursements.sum(&:amount_cents) }
  )

  computed_attribute(
    :total_disbursements_currency,
    Entry
      .where('"entries"."budget_id" = "budgets"."id"')
      .with_disbursements
      .limit(1)
      .select('"entries"."amount_currency"'),
    proc { disbursements.first.amount_currency }
  )

  scope :selecting_total_disbursements, -> { selecting_total_disbursements_cents.selecting_total_disbursements_currency }

  def total_disbursements
    @total_disbursements ||= Money.new(total_disbursements_cents, total_disbursements_currency)
  end

  computed_attribute(
    :total_cash_on_hand_cents,
    Entry
      .where('"entries"."budget_id" = "budgets"."id"')
      .select('SUM("entries"."amount_cents")'),
    proc { entries.sum(&:amount_cents) }
  )

  computed_attribute(
    :total_cash_on_hand_currency,
    Entry
      .where('"entries"."budget_id" = "budgets"."id"')
      .limit(1)
      .select('"entries"."amount_currency"'),
    proc { entries.first.amount_currency }
  )

  scope :selecting_total_cash_on_hand, -> { selecting_total_cash_on_hand_cents.selecting_total_cash_on_hand_currency }

  def total_cash_on_hand
    @total_cash_on_hand ||= Money.new(total_cash_on_hand_cents, total_cash_on_hand_currency)
  end
end
