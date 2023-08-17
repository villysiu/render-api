class AddCommentIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :comment_id, :integer
    remove_index :likes, name: "index_likes_on_photo_id_and_user_id"
  end
end
