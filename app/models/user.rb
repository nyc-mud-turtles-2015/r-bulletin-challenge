class User < ActiveRecord::Base
  has_secure_password
  has_many :messages
  has_many :conversations

  validates_presence_of :username, :email
  validates_uniqueness_of :username
end
