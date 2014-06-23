json.array!(@networks) do |network|
  json.extract! network, :id, :contact, :notes
  json.url network_url(network, format: :json)
end
