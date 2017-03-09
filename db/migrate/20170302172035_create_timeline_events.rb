class CreateTimelineEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :timeline_events do |t|
      t.string :image
      t.string :image_caption
      t.string :image_description
      t.string :image_alternative_text
      t.text :event_description
      t.references :saint, foreign_key: true

      t.timestamps
    end
    add_index :timeline_events, [:saint_id, :created_at]
  end
end
