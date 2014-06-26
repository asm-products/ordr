class Interview
  include Mongoid::Document
  field :interview_things, type: String

  embedded_in :job
end
