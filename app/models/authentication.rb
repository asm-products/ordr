class Authentication
  include Mongoid::Document
  field :provider, type: String
  field :uid, type: String
  validates_presence_of :provider, :uid
  belongs_to :user

  def self.find_or_create(auth_hash)
    user = User.create(name: auth_hash["info"]["name"], email: auth_hash["info"]["email"])
    auth = user.authentications.find_or_create_by(uid: auth_hash["uid"], provider: auth_hash["provider"])
    auth.save
    auth
  end
end
