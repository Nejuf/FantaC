json.array!(@affinities) do |affinity|
  json.extract! affinity, 
  json.url affinity_url(affinity, format: :json)
end
