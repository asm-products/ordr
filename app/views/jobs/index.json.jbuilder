json.array!(@jobs) do |job|
  json.extract! job, :id, :company, :postion, :link
  json.url job_url(job, format: :json)
end
