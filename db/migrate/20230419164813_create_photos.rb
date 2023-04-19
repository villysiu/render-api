class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :url
      t.text :desc
      t.integer :user_id

      t.timestamps
    end
  end
end
