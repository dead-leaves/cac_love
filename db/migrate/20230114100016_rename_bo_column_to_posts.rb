class RenameBoColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :bo, :body
  end
end
