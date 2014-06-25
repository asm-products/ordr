class Job
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :company
  field :postion
  field :link

  has_one :research
  has_one :apply
  has_one :writing
  has_many :interviews
  has_many :networks
end
