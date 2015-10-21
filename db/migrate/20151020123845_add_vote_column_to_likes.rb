class AddVoteColumnToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :votes, :integer, null: false
  end
end
