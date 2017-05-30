class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :writer
      t.text :content
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
