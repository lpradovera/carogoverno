class AddVotedAtToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :voted_at, :timestamp
  end
end
