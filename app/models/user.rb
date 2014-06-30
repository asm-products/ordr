class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_secure_password validations: false
  validates_uniqueness_of :email if :email
  validates_confirmation_of :password if :password

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  has_many :authentications
  has_many :jobs

  def add_provider(auth_hash)
    unless has_provider(auth_hash["provider"])
      auth = Authentication.create(user: self, uid: auth_hash["uid"], provider: auth_hash["provider"])
      authentications << auth
    end
  end

private
  def has_provider(provider)
    authentications.any? {|x| x.provider == provider}
  end
end
