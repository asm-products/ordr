class Research
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :values
  field :salary
  field :location
  field :notes

  belongs_to :job
end
