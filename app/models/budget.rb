class Budget < ApplicationRecord
  belongs_to :campaign
  has_many :transactions
end
