class User < ActiveRecord::Base
  has_secure_password
  has_many :messages
  has_many :conversations

  validates_presence_of :username, :email
  validates_uniqueness_of :username

  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash[:provider], uid: auth_hash[:uid], email: "oauth_user@example.com", password_digest: "X").first_or_create
    user.update(
      username: auth_hash[:info][:name],
      profile_image: auth_hash[:info][:image],
      token: auth_hash[:credentials][:token],
      secret: auth_hash[:credentials][:secret]
      )
    user
  end

end
