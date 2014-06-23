class Writing
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :resume, type: Mongoid::Boolean
  field :cover_letter, type: Mongoid::Boolean


  embedded_in :job, inverse_of: :writing
  has_many :notes, as: :notable
end
