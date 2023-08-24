class ChangeColNamesInNotification < ActiveRecord::Migration[7.0]
  def change
    remove_column :notifications, :user_id, :string
    remove_column :notifications, :from_user_id, :string
    add_column :notifications, :user_id, :integer
    add_column :notifications, :from_user_id, :integer
  end
end
