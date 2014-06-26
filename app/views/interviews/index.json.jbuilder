json.array!(@interviews) do |interview|
  json.extract! interview, :id, :interview_things
  json.url interview_url(interview, format: :json)
end
