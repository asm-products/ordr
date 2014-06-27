json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :company, :email, :phone, :linkedin_url
  json.url contact_url(contact, format: :json)
end
