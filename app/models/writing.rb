class Writing
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :resume, type: Mongoid::Boolean
  field :cover_letter, type: Mongoid::Boolean


  has_many :notes, as: :notable
  has_many :contacts, as: :contactable

  belongs_to :job
end
