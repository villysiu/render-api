class AddIndexToLike < ActiveRecord::Migration[7.0]
  def change
    add_index :likes, [:photo_id, :user_id], unique: true
  end
end
