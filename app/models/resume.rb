class Resume
  include Mongoid::Document
  field :resume_things, type: String

  embedded_in :job
end
