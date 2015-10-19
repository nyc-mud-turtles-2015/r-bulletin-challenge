class Conversation < ActiveRecord::Base
  belongs_to :topic
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :messages

  def active?
    (Time.now - latest_message.created_at) < 20_000
  end

  private

  def latest_message
    messages.order(created_at: :desc).limit(1).first
  end
end
