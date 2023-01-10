class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.integer :user_id, null: false
      t.integer :search_tag_id, null: false
      t.string :titl, null: false
      t.text :boby, null: false
      
      

      t.timestamps
    end
  end
end
