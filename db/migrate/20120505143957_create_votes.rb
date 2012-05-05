class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :post_id
      t.boolean :like

      t.timestamps
    end
  end
end
