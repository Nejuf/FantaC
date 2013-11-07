json.array!(@battle_rosters) do |battle_roster|
  json.extract! battle_roster, 
  json.url battle_roster_url(battle_roster, format: :json)
end
