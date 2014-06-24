class Job
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :company
  field :position
  field :link

  embeds_one :research
  embeds_one :apply
  embeds_one :writing
  embeds_many :interviews
  embeds_many :networks
end
