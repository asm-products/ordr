class Research
  include Mongoid::Document
  include Mongoid::Timestamps

  field :company_mission, type: String
  field :company_goals, type: String
  field :current_projects, type: String
  field :done, type: Mongoid::Boolean

  has_many :notes
  has_many :contacts
  embedded_in :job
end
