class AddLatitudeAndLongitudeToSaints < ActiveRecord::Migration[5.0]
  def change
  	add_column :saints, :birth_latitude, :float
  	add_column :saints, :birth_longitude, :float
  	add_column :saints, :death_latitude, :float
  	add_column :saints, :death_longitude, :float
  end
end
