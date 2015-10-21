class User < ActiveRecord::Base
  has_secure_password
  has_many :messages
  has_many :conversations
  validates :provider, uniqueness: {scope: :uid}
  # validates :email, presence: true

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    username = auth_hash[:info][:nickname]
    password = SecureRandom.hex
    email = auth_hash[:info][:email]
    user_info = {email: email, provider: provider, uid: uid, username: username, password: password}
    user = User.find_by(username: username) || User.new(user_info)
  end
end
