class Topic < ActiveRecord::Base
  belongs_to :category, touch: true
  has_many :conversations
end
