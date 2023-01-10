class CreateSearchTags < ActiveRecord::Migration[6.1]
  def change
    create_table :search_tags do |t|

      t.timestamps
    end
  end
end
