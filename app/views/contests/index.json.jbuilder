json.array!(@contests) do |contest|
  json.extract! contest, 
  json.url contest_url(contest, format: :json)
end
