json.array!(@character_entries) do |character_entry|
  json.extract! character_entry, 
  json.url character_entry_url(character_entry, format: :json)
end
