class JobApplication
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :sent, type: Mongoid::Boolean

  has_many :contacts, as: :contactable
  has_many :notes, as: :notable
  embedded_in :job
end
