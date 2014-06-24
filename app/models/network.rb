class Network
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :contact
  field :notes

  belongs_to :job
end
