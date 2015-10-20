class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  has_many :likes
end
