class Transaction < ApplicationRecord
  belongs_to :budget
  has_one :contribution
  has_one :disbursement

  monetize :amount_cents

  validates :date, :amount, presence: true
end
