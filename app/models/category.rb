class Category < ActiveRecord::Base
  has_many :topics

  validates_presence_of :name, :display_order
end
