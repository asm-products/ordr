class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  embeds_many :authentications

  def add_provider(auth_hash)
    unless authentications.where(uid: auth_hash["uid"], provider: auth_hash["provider"])
      Authentication.create(user: self, uid: auth_hash["uid"], provider: auth_hash["provider"])
    end
  end
end
