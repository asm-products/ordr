json.array!(@researches) do |research|
  json.extract! research, :id, :values, :salary, :location, :notes
  json.url research_url(research, format: :json)
end
