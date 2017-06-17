class Saint < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :written_works, dependent: :destroy
  has_many :timeline_events, dependent: :destroy
  has_many :saint_photos, dependent: :destroy

  validates :name,
    presence: { message: 'name required' },
    length: { maximum: 255, message: 'must be 255 characters or less' }
  validates :gender, presence: { message: 'gender required' }
  validates :feast_day, presence: { message: 'feast day required' }
  validates :short_description, presence: { message: 'short description required' }
  validates :long_description, presence: { message: 'long description required' }
  validates :canonization_status, presence: { message: 'canonization status required' }
  validates :fame_level, presence: { message: 'fame level required' }

  # Follows a saint.
  def follow(other_saint)
    following << other_saint
  end

  # Unfollows a saint.
  def unfollow(other_saint)
    following.delete(other_saint)
  end

  # Returns true if the current saint is following the other saint.
  def following?(other_saint)
    following.include?(other_saint)
  end
end
