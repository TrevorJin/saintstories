class AddPublicationAccuracyToWrittenWorks < ActiveRecord::Migration[5.0]
  def change
  	add_column :written_works, :publication_accuracy, :integer
  end
end
