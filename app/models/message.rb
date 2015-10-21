class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  has_many :likes

  validates :user, :conversation, presence: true

  def karma
    Like.where("message_id = ?", [id]).sum(:vote)
  end
end
