class Network
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :date
  field :time

  has_many :contacts, as: :contactable
  has_many :notes, as: :notable

  belongs_to :job

end
