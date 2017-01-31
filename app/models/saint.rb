class Saint < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  validates :name,
    presence: { message: 'name required' },
    length: { maximum: 255, message: 'must be 255 characters or less' }
  validates :gender, presence: { message: 'gender required' }
  validates :feast_day, presence: { message: 'feast day required' }
end
