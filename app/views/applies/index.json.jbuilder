json.array!(@applies) do |apply|
  json.extract! apply, :id, :sent, :notes
  json.url apply_url(apply, format: :json)
end
