class ChangeColNamesInFollower < ActiveRecord::Migration[7.0]
  def change
    remove_column :followers, :user_id, :string
    remove_column :followers, :follower_id, :string
    add_column :followers, :user_id, :integer
    add_column :followers, :follower_id, :integer
  end
end
