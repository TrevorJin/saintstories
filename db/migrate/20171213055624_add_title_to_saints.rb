class AddTitleToSaints < ActiveRecord::Migration[5.0]
  def change
  	add_column :saints, :title, :integer
  end
end
