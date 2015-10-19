class Conversation < ActiveRecord::Base
  belongs_to :topic
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :messages

  accepts_nested_attributes_for :messages
  validates :name, presence: true
  validate :message_exists

  private
  def message_exists
    errors.add(:base, "No message present") if self.messages.empty?
  end
end
