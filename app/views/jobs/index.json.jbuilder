json.array!(@jobs) do |job|
  json.extract! job, :id, :company, :postion
  json.url job_url(job, format: :json)
end
