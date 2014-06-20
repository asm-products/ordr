class Job
  include Mongoid::Document
  include Mongoid::Timestamps

  field :company
  field :postion
  field :link
end
