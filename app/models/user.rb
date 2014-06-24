class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  has_many :authentications
  attr_accessor :password, :password_confirmation
  has_secure_password validations: false

  def add_provider(auth_hash)
    unless authentications.where(uid: auth_hash["uid"], provider: auth_hash["provider"])
      Authentication.create(user: self, uid: auth_hash["uid"], provider: auth_hash["provider"])
    end
  end
end
