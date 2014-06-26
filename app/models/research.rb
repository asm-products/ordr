class Research
  include Mongoid::Document
  field :research_things, type: String

  embedded_in :job
end
