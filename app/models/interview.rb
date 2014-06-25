class Interview
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :type
  field :thank_you, type: Mongoid::Boolean


  has_many :contacts, as: :contactable
  has_many :notes, as: :notable
  belongs_to :job
end
