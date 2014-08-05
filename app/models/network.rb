class Network
  include Mongoid::Document
  include Mongoid::Timestamps

  field :date, type: DateTime
  field :done, type: Mongoid::Boolean
  field :plans, type: Mongoid::Boolean

  has_many :contacts
  has_many :notes
  embedded_in :job
end
