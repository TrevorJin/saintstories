class AddSlugToSaints < ActiveRecord::Migration[5.0]
  def change
    add_column :saints, :slug, :string
    add_index :saints, :slug, unique: true
  end
end
