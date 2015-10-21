class User < ActiveRecord::Base
  # has_secure_password
  has_many :messages
  has_many :conversations
  # validates :email, presence: true

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["name"]
    end
  end
end
