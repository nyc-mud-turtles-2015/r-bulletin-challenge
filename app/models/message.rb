class Message < ActiveRecord::Base
  has_attached_file :clip, styles: { medium: "300x300>", thumb: "100x100>" }

  belongs_to :conversation, touch: true
  belongs_to :user

  validates_attachment_content_type :clip, content_type: /\Aimage\/.*\Z/
  validates :content, presence: true

  delegate :username, to: :user, prefix: false, allow_nil: true

  def in_caps
    content.upcase if content
  end
end
