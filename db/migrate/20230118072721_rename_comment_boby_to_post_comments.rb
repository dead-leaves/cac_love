class RenameCommentBobyToPostComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_comments, :comment_boby, :comment
  end
end
