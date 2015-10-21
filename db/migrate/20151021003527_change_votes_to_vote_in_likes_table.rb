class ChangeVotesToVoteInLikesTable < ActiveRecord::Migration
  def change
    rename_column :likes, :votes, :vote
  end
end
