class RenameTitlColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :titl, :title
  end
end
