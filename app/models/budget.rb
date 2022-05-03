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

  scope :select_total_contributions, -> { select_total_contributions_cents }

  def total_contributions
    @total_contributions ||= Money.new(total_contributions_cents)
  end

  computed_attribute(
    :total_disbursements_cents,
    Entry
      .where('"entries"."budget_id" = "budgets"."id"')
      .with_disbursements
      .select('-SUM("entries"."amount_cents")'),
    proc { disbursements.sum(&:amount_cents) }
  )

  scope :select_total_disbursements, -> { select_total_disbursements_cents }

  def total_disbursements
    @total_disbursements ||= Money.new(total_disbursements_cents)
  end

  computed_attribute(
    :total_cash_on_hand_cents,
    Entry
      .where('"entries"."budget_id" = "budgets"."id"')
      .select('SUM("entries"."amount_cents")'),
    proc { entries.sum(&:amount_cents) }
  )

  scope :select_total_cash_on_hand, -> { select_total_cash_on_hand_cents }

  def total_cash_on_hand
    @total_cash_on_hand ||= Money.new(total_cash_on_hand_cents)
  end

  computed_attribute(
    :current_cash_on_hand_cents,
    Entry
      .where('"entries"."budget_id" = "budgets"."id"')
      .on_or_before(Date.current)
      .select('SUM("entries"."amount_cents")'),
    proc do
      entries
        .select { |entry| entry.date <= Date.current }
        .sum(&:amount_cents)
    end
  )

  scope :select_current_cash_on_hand, -> { select_current_cash_on_hand_cents }

  def current_cash_on_hand
    @current_cash_on_hand ||= Money.new(current_cash_on_hand_cents)
  end
end
