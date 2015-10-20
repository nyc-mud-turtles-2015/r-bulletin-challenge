class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :user_id, null: false
      t.string :message_id, null: false

      t.timestamps null: false
    end

    add_index :likes, [:user_id, :message_id], unique: true
  end
end
