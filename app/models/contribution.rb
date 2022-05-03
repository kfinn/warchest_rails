class Contribution < ApplicationRecord
  belongs_to :entry

  delegate(
    :amount,
    :amount=,
    :amount_cents,
    :amount_cents=,
    :amount_currency,
    :amount_currency=,
    to: :entry
  )
end
