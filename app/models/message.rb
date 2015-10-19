class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  validates :user, :conversation, presence: true
end
