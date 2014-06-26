class Apply
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :sent, type: Mongoid::Boolean
  field :notes

  has_many :contacts, as: :contactable
  has_many :notes, as: :notable
  belongs_to :job
end
