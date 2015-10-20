class Conversation < ActiveRecord::Base
  belongs_to :topic, touch: true
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :messages, dependent: :destroy

  validates_presence_of :name

  def self.recently_active(n)
    Conversation.order(updated_at: :desc).limit(n)
  end
end
