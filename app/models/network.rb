class Network
  include Mongoid::Document
  field :network_things, type: String

  embedded_in :job
end
