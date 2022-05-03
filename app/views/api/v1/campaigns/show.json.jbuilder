json.extract! @campaign, :id, :name
json.budgets @campaign.budgets.select_table_columns.select_current_cash_on_hand do |budget|
  json.extract! budget, :id, :name
  json.current_cash_on_hand budget.current_cash_on_hand.to_s
end
