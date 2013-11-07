json.array!(@battles) do |battle|
  json.extract! battle, 
  json.url battle_url(battle, format: :json)
end
