class User < ActiveRecord::Base
  has_secure_password
  has_many :messages
  has_many :conversations
  validates :password, confirmation: true
  validates :username, :email, presence: true, uniqueness: true

end
