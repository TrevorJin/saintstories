class SaintPhoto < ApplicationRecord
	mount_uploader :photo, PhotoUploader
	belongs_to :saint
	validates :saint_id, presence: true
	validates :photo_priority, presence: true
	validates :width, presence: true
	validates :height, presence: true
end
