class User < ApplicationRecord
  has_many :budgets, through: :campaigns
end
