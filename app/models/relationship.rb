class Relationship < ApplicationRecord
	belongs_to :follower, class_name: "Saint"
  belongs_to :followed, class_name: "Saint"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
