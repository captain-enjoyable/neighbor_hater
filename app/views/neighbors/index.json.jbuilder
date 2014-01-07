json.array!(@neighbors) do |neighbor|
  json.extract! neighbor, :address, :rating
  json.url neighbor_url(neighbor, format: :json)
end
