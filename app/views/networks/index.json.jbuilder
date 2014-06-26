json.array!(@networks) do |network|
  json.extract! network, :id, :network_things
  json.url network_url(network, format: :json)
end
