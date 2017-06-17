class AddFameToSaints < ActiveRecord::Migration[5.0]
  def change
  	add_column :saints, :fame_level, :integer
  end
end



class AddPhotoPriorityToSaintPhotos < ActiveRecord::Migration[5.0]
  def change
  	add_column :saint_photos, :photo_priority, :integer
  end
end
