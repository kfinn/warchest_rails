class Budget < ApplicationRecord
  belongs_to :campaign
  has_many :entries
  has_many :contributions, through: :entries
  has_many :disbursements, through: :entries

  def total_contributions
    contributions.sum(&:amount)
  end

  def total_disbursements
    disbursements.sum(&:amount)
  end

  def total_cash_on_hand
    entries.sum(&:amount)
  end
end
