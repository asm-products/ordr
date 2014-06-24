class Interview
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :type
  field :thank_you, type: Mongoid::Boolean

  belongs_to :job
end
