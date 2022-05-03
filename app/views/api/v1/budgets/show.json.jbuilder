json.extract! @budget, :id, :name

json.total_contributions @budget.total_contributions.to_s
json.total_disbursements @budget.total_disbursements.to_s
json.total_cash_on_hand @budget.total_cash_on_hand.to_s

json.campaign do
  json.extract! @budget.campaign, :id, :name
end
