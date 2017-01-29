class AddBeatificationCanonizationAccuracyToSaints < ActiveRecord::Migration[5.0]
  def change
  	add_column :saints, :beatification_accuracy, :integer
  	add_column :saints, :canonization_accuracy, :integer
  end
end
