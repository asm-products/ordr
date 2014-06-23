class Note
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :content, type: String
  belongs_to :notable, polymorphic: true
end
