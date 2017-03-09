class AddAvatarInfoToSaints < ActiveRecord::Migration[5.0]
  def change
  	add_column :saints, :avatar_caption, :string
  	add_column :saints, :avatar_description, :string
  	add_column :saints, :avatar_alternative_text, :string
  end
end
