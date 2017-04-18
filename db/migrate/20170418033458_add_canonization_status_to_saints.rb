class AddCanonizationStatusToSaints < ActiveRecord::Migration[5.0]
  def change
  	add_column :saints, :canonization_status, :string
  end
end
