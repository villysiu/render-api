class AddUniquenessToFollowers < ActiveRecord::Migration[7.0]
  def change
    add_index :followers, [:user_id, :follower_id], unique: true
  end
end
