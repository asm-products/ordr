class Authentication
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps
  
  field :provider, type: String
  field :uid, type: String
  validates_presence_of :provider, :uid
  belongs_to :user

  def self.find_or_create(auth_hash)
    auth = Authentication.find_or_create_by(uid: auth_hash["uid"], provider: auth_hash["provider"])
    unless auth.user
      user = User.create(name: auth_hash["info"]["name"], email: auth_hash["info"]["email"])
      auth.user = user
    end
    auth.save
    auth
  end
end
