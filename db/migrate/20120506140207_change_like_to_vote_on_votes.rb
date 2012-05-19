class ChangeLikeToVoteOnVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :like
    add_column :votes, :vote, :integer, :default => 1
  end
end
