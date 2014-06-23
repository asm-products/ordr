class Network
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :contact
  field :notes

  embedded_in :job
  has_many :contacts, as: :contactable
  has_many :notes, as: :notable
end
