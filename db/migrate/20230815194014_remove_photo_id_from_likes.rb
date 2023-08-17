class RemovePhotoIdFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :photo_id, :integer
  end
end
