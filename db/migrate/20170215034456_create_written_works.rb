class CreateWrittenWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :written_works do |t|
      t.string :title
      t.date :publication_date
      t.string :description
      t.references :saint, foreign_key: true

      t.timestamps
    end
    add_index :written_works, [:saint_id, :created_at]
  end
end
