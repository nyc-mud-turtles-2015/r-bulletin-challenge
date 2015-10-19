class User < ActiveRecord::Base
  has_secure_password
  has_many :messages
  has_many :conversations

  validates :username, uniqueness: true, presence: true
  validates_presence_of :password_digest, :email
  # private
  # def user_params
  #   params.require(:user).permit(:username, :password, :email)
  # end
end
