class Network
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :date, type: DateTime
  field :done, type: Mongoid::Boolean
  
  has_many :contacts, as: :contactable
  has_many :notes, as: :notable
  embedded_in :job
end
