class Contact
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps
  field :name, type: String
  field :company, type: String
  field :email, type: String
  field :phone, type: String
  field :linkedin_url, type: String

  belongs_to :research, dependent: :delete
  belongs_to :network, dependent: :delete
  belongs_to :resume, dependent: :delete
  belongs_to :job_application, dependent: :delete
  belongs_to :interview, dependent: :delete
end
