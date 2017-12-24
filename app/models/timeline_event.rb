class TimelineEvent < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :saint
  validates :saint_id, presence: true
  validates :event_priority, presence: true
  validates :event_title, presence: true
  validates :event_time, presence: true
  validates :event_description, presence: true
end
