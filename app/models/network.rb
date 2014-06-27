class Network
  include Mongoid::Document
  include Mongoid::Timestamps

  field :date, type: DateTime
  field :done, type: Mongoid::Boolean

  has_many :contacts, dependent: :delete
  has_many :notes, dependent: :delete
  embedded_in :job
end
