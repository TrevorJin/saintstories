class AddDescriptionsToSaints < ActiveRecord::Migration[5.0]
  def change
  	add_column :saints, :short_description, :text
  	add_column :saints, :long_description, :text
  end
end
