class AddReportedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :reported, :integer, :default => 0, :null => false
  end
end
