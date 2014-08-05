class Interview
  include Mongoid::Document
  include Mongoid::Timestamps
  field :type
  field :date, type: DateTime
  field :thank_you, type: Mongoid::Boolean

  has_many :contacts
  has_many :notes

  embedded_in :job
end
