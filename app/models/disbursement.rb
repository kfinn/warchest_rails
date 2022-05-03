class Disbursement < ApplicationRecord
  belongs_to :entry, dependent: :destroy
  has_one :budget, through: :entry

  validates_associated :entry

  validate :amount_must_be_positive

  def amount_must_be_positive
    errors.add(:amount, 'must be positive') unless amount > 0
  end

  def amount
    -entry.amount
  end

  def amount=(amount)
    entry.amount = -amount.to_money
  end

  def amount_cents
    -entry.amount_cents
  end

  def amount_cents=(amount_cents)
    entry.amount_cents = -amount_cents
  end

  delegate :amount_currency, :amount_currency=, :date, :date=, to: :entry

  def entry
    super || build_entry
  end
end
