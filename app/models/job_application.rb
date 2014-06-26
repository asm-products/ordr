class JobApplication
  include Mongoid::Document
  field :application_things, type: String

  embedded_in :job
end
