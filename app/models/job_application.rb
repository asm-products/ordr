class JobApplication
  include Mongoid::Document
  include Mongoid::Timestamps

  field :sent, type: Mongoid::Boolean
  field :date, type: DateTime

  has_many :contacts
  has_many :notes
  embedded_in :job
end
