class RemoveTextFromComment < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :comment, :string
    remove_column :comments, :text, :string
  end
end
