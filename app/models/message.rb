class Message < ActiveRecord::Base
  belongs_to :conversation, touch: true
  belongs_to :user

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }

  validates :content, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  delegate :username, to: :user, prefix: false, allow_nil: true

  def in_caps
    content.upcase if content
  end
end
