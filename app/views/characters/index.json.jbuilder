json.array!(@characters) do |character|
  json.extract! character, 
  json.url character_url(character, format: :json)
end
