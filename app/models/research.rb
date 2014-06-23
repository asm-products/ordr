class Research
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :values
  field :salary
  field :location

  embedded_in :job, inverse_of: :research
  has_many :notes, as: :notable
end
