class Conversation < ActiveRecord::Base
  belongs_to :topic
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :messages

  def self.active
    active_conversations = []
    Conversation.all.each do |conversation|
      conversation.messages.each do |message|
        if message.updated_at > (Time.now - 86400)
          active_conversations << conversation
        end
      end
    end
    active_conversations
  end
end
