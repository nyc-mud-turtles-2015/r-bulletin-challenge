class User < ActiveRecord::Base
  has_secure_password
  has_many :messages
  has_many :conversations
  has_many :likes

  validates_uniqueness_of :email, :username
end
