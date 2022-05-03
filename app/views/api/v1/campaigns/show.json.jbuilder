json.extract! @campaign, :id, :name
json.budgets @campaign.budgets do |budget|
  json.extract! budget, :id, :name
end
