class Disbursement < ApplicationRecord
  belongs_to :entry

  def amount
    -entry.amount
  end

  def amount=(amount)
    entry.amount = -amount
  end

  def amount_cents
    -entry.amount_cents
  end

  def amount_cents=(amount_cents)
    entry.amount_cents = -amount_cents
  end

  delegate :amount_currency, :amount_currency=, to: :entry
end
