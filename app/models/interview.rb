class Interview
  include Mongoid::Document
  include Mongoid::Timestamps
  field :type
  field :thank_you, type: Mongoid::Boolean

  has_many :contacts, dependent: :delete
  has_many :notes, dependent: :delete

  embedded_in :job
end
