json.array!(@tiers) do |tier|
  json.extract! tier, 
  json.url tier_url(tier, format: :json)
end
