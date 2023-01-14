class RenameBobyColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :boby, :bo
  end
end
