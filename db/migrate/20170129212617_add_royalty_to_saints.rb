class AddRoyaltyToSaints < ActiveRecord::Migration[5.0]
  def change
  	add_column :saints, :royalty, :boolean, default: false
  end
end
