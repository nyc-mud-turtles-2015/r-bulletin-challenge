class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :message

  validates :user, :message, :vote, presence: true
  validates :vote, numericality: { only_integer: true }
  validates :user, uniqueness: { scope: :message }
end
