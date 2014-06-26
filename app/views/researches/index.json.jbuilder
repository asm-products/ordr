json.array!(@researches) do |research|
  json.extract! research, :id, :research_things
  json.url research_url(research, format: :json)
end
