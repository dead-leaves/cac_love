class CreateSearchTags < ActiveRecord::Migration[6.1]
  def change
    create_table :search_tags do |t|
      
      t.integer :tag_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
