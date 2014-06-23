class Research
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :values
  field :salary
  field :location
  field :notes

  embedded_in :job
end
