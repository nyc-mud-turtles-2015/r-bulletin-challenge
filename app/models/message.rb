class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  validates :content, :user, presence: true
end
