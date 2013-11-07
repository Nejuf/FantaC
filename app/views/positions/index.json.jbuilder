json.array!(@positions) do |position|
  json.extract! position, 
  json.url position_url(position, format: :json)
end
