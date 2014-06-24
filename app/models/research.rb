class Research
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :values
  field :salary
  field :location

  has_many :notes, as: :notable

  belongs_to :job
end
