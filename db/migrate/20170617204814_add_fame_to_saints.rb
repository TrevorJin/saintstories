class AddFameToSaints < ActiveRecord::Migration[5.0]
  def change
  	add_column :saints, :fame_level, :integer
  end
end
