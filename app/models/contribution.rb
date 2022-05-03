class Contribution < ApplicationRecord
  belongs_to :entry, dependent: :destroy
  has_one :budget, through: :entry
  
  validates_associated :entry

  validate :amount_must_be_positive

  def amount_must_be_positive
    errors.add(:amount, 'must be positive') unless amount > 0
  end

  delegate(
    :amount,
    :amount=,
    :amount_cents,
    :amount_cents=,
    :amount_currency,
    :amount_currency=,
    :date,
    :date=,
    to: :entry
  )

  def entry
    super || build_entry
  end
end
