class Research
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :company_mission, type: String
  field :company_goals, type: String
  field :current_projects, type: String
  field :done, type: Mongoid::Boolean

  has_many :notes, as: :notable
  has_many :contacts, as: :contactable
  embedded_in :job
end
