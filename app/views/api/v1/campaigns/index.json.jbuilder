json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :name
end
