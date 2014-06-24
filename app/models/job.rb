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
  before_create :initialize_job

  private
   def initialize_job
     self.research = Research.create(job_id: self.id)
     self.apply = Apply.create(job_id: self.id)
     self.writing = Writing.create(job_id: self.id)
     self.networks << Network.create(job_id: self.id)
     self.interviews << Interview.create(job_id: self.id)
   end
end
