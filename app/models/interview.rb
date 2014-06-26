class Interview
  include Mongoid::Document
  field :interview_things, type: String

  field :type
  field :thank_you, type: Mongoid::Boolean

  has_many :contacts, as: :contactable
  has_many :notes, as: :notable

  embedded_in :job
end
