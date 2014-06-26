class Network
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps
  field :date, type: DateTime
  field :done, type: Mongoid::Boolean
  embedded_in :job
end
