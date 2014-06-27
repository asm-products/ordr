class Job
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps
  field :title, type: String
  field :url, type: String
  field :company_name, type: String
  field :due_date, type: DateTime
  field :type, type: String

  embeds_many :interviews
  embeds_many :networks
  embeds_one :research
  embeds_one :resume
  embeds_one :job_application

  has_many :contacts, as: :contactable
  belongs_to :user
  accepts_nested_attributes_for :research, :networks, :resume, :job_application, :interviews
  after_create :initialize_job

  def initialize_job
    self.research = self.create_research
    self.job_application = self.create_job_application
    self.resume = self.create_resume
    self.networks.create
    self.interviews.create
  end
end

