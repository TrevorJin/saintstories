class AddImageUrlToSaints < ActiveRecord::Migration[5.0]
  def change
  	add_column :saints, :image_url, :string
  end
end
