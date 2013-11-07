json.array!(@payout_types) do |payout_type|
  json.extract! payout_type, 
  json.url payout_type_url(payout_type, format: :json)
end
