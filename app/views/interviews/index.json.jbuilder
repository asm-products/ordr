json.array!(@interviews) do |interview|
  json.extract! interview, :id, :type, :thank_you
  json.url interview_url(interview, format: :json)
end
