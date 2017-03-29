class AddPhotoPriorityToSaintPhotos < ActiveRecord::Migration[5.0]
  def change
  	add_column :saint_photos, :photo_priority, :integer
  end
end
