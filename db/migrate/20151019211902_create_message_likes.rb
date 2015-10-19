class CreateMessageLikes < ActiveRecord::Migration
  def change
    create_table :message_likes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :message, index: true, foreign_key: true
    end
  end
end
