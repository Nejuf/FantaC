json.array!(@contest_positions) do |contest_position|
  json.extract! contest_position, 
  json.url contest_position_url(contest_position, format: :json)
end
