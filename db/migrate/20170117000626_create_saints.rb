class CreateSaints < ActiveRecord::Migration[5.0]
  def change
    create_table :saints do |t|
      t.string :name
      t.string :gender
      t.date :feast_day
      t.datetime :birth_date
      t.integer :birth_accuracy
      t.datetime :death_date
      t.integer :death_accuracy
      t.string :birth_location
      t.string :death_location
      t.datetime :beatification_date
      t.datetime :canonization_date
      t.boolean :pope, default: false
      t.boolean :cardinal, default: false
      t.boolean :bishop, default: false
      t.boolean :priest, default: false
      t.boolean :religious, default: false
      t.boolean :lay, default: false
      t.boolean :martyr, default: false
      t.boolean :founder, default: false
      t.boolean :mystic, default: false
      t.boolean :doctor_of_the_church, default: false
      t.boolean :early_church_father, default: false

      t.timestamps
    end
  end
end
