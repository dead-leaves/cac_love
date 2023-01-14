class RemoveSearchTagIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :search_tag_id, :integer
  end
end
