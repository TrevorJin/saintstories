class RemoveCanonizationStatusFromSaints < ActiveRecord::Migration[5.0]
  def change
  	remove_column :saints, :canonization_status
  end
end
