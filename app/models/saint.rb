class Saint < ApplicationRecord
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

  validates :name,
    presence: { message: 'name required' },
    length: { maximum: 255, message: 'must be 255 characters or less' }
  validates :gender, presence: { message: 'gender required' }
  validates :feast_day, presence: { message: 'feast day required' }

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
