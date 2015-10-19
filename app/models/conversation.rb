class Conversation < ActiveRecord::Base
  belongs_to :topic
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :messages

  def self.with_recent_messages
    self.where(id: Message.recent_convo_ids)
  end

end


   # messages.recent.order(created_at: :DESC).first
