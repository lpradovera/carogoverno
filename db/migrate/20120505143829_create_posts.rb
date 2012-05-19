class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.timestamp :posted_at
      t.text :body

      t.timestamps
    end
  end
end
