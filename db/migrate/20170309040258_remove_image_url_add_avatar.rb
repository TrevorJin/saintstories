class RemoveImageUrlAddAvatar < ActiveRecord::Migration[5.0]
  def change
  	remove_column :saints, :image_url
  	add_column :saints, :avatar, :string
  end
end
