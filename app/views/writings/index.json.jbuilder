json.array!(@writings) do |writing|
  json.extract! writing, :id, :resume, :cover_letter, :notes
  json.url writing_url(writing, format: :json)
end
