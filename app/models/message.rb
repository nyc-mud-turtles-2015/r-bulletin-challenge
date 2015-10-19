class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  validates :conversation, presence:true
end
