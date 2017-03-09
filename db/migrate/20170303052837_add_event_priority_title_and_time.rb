class AddEventPriorityTitleAndTime < ActiveRecord::Migration[5.0]
  def change
  	add_column :timeline_events, :event_priority, :integer
  	add_column :timeline_events, :event_title, :string
  	add_column :timeline_events, :event_time, :string
  end
end
