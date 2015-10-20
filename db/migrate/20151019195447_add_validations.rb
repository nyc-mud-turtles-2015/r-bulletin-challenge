class AddValidations < ActiveRecord::Migration
  def change
    change_column_null :users, :username, false
    add_index :users, :username, unique: true
    change_column_null :users, :email, false
    change_column_null :categories, :name, false
    change_column_null :categories, :display_order, false
    change_column_null :topics, :name, false
    change_column_null :conversations, :name, false
    change_column_null :messages, :content, false
  end
end
