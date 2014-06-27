class Job
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps
  field :title, type: String
  field :url, type: String
  field :company_name, type: String
  field :due_date, type: DateTime
  field :type, type: String

  embeds_one :interview
  embeds_one :network
  embeds_one :research
  embeds_one :resume
  embeds_one :job_application

  has_many :contacts, as: :contactable
  belongs_to :user
  accepts_nested_attributes_for :research, :network, :resume, :job_application, :interview
  after_create :initialize_job

  def initialize_job
    self.research = self.create_research
    self.job_application = self.create_job_application
    self.resume = self.create_resume
    self.network = self.create_network
    self.interview = self.create_interview
  end
end
