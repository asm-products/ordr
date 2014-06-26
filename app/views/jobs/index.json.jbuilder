json.array!(@jobs) do |job|
  json.extract! job, :id, :company, :position, :link
  json.url job_url(job, format: :json)
end
