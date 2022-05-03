class Entry < ApplicationRecord
  belongs_to :budget
  has_one :contribution
  has_one :disbursement

  monetize :amount_cents

  validates :date, :amount, presence: true

  scope :with_contributions, -> { where id: Contribution.select(:entry_id) }
  scope :with_disbursements, -> {where id: Disbursement.select(:entry_id) }

  scope :on_or_before, ->(date) { where 'date <= ?', date }
end
