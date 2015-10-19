class Conversation < ActiveRecord::Base
  belongs_to :topic
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :messages

  validates_presence_of :name

  # gets conversations from latest n messages,
  # want to get last n conversations from latest messages
  # not sure how
  def self.recently_active(n)
    Conversation
    .includes(:messages)
    .joins(:messages)
    .order("messages.created_at DESC")
    .group("conversations.id, messages.id")
    .limit(n)
  end
end
