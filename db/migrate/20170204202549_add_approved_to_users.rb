class AddApprovedToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :approved, :boolean, default: false
  	add_column :users, :approved_at, :datetime
  end
end
