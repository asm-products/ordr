class Authentication
  include Mongoid::Document
  field :provider, type: String
  field :uid, type: String
  validates_presence_of :provider, :uid
  embedded_in :user

  def self.find_or_create(auth_hash)
    user = User.create(name: auth_hash["name"], email: auth_hash["email"])
    auth = Authentication.find_or_initialize_by(uid: auth_hash["uid"], provider: auth_hash["provider"])
    auth.user = user
    auth.save
    auth
  end
end
