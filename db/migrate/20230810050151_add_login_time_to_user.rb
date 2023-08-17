class AddLoginTimeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :login_time, :datetime
  end
end
