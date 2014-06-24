class Research
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :values
  field :salary
  field :location

  has_many :notes, as: :notable
  has_many :contacts, as: :contactable
  belongs_to :job
end
