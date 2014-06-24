class Apply
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :sent, type: Mongoid::Boolean
  field :notes

  belongs_to :job
end
