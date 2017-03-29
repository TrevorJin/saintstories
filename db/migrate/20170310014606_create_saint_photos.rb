class CreateSaintPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :saint_photos do |t|
    	t.string :photo
    	t.string :photo_caption
      t.string :photo_description
      t.string :photo_alternative_text
      t.integer :width
      t.integer :height
      t.references :saint, foreign_key: true

      t.timestamps
    end
    add_index :saint_photos, [:saint_id, :created_at]
  end
end
