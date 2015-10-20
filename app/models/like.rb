class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :message

  validates :user, :message, :votes, presence: true
  validates :votes, numericality: { only_integer: true }
end
