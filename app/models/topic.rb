class Topic < ActiveRecord::Base
  belongs_to :category
  has_many :conversations

  validates_presence_of :name
end
