json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :url, :company_name, :due_date, :done
  json.url job_url(job, format: :json)
end
