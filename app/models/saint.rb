class Saint < ApplicationRecord
  APPROX_YEAR = 0
  EXACT_YEAR = 1
  EXACT_MONTH_YEAR = 2
  EXACT_DATE = 3
  YEAR_FORMAT = "%-Y"
  MONTH_YEAR_FORMAT = "%B %-Y"
  MONTH_DAY_YEAR_FORMAT = "%B %d, %-Y"
  DATE_ACCURACIES = { 'We only know the approximate year.' => APPROX_YEAR,
                      'We only know the exact year.' => EXACT_YEAR,
                      'We only know the exact month and year.' => EXACT_MONTH_YEAR,
                      'We know the exact day, month, and year.' => EXACT_DATE }
  enum birth_accuracy: DATE_ACCURACIES, _prefix: true
  enum death_accuracy: DATE_ACCURACIES, _prefix: true
  enum beatification_accuracy: DATE_ACCURACIES, _prefix: true
  enum canonization_accuracy: DATE_ACCURACIES, _prefix: true
  enum title: { 'Saint' => 0,
                'Blessed' => 1,
                'Venerable' => 2,
                'Servant of God' => 3 }
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
  validates :birth_accuracy, inclusion: { in: birth_accuracies.keys },
                             presence: { message: 'birth accuracy required' }
  validates :death_accuracy, inclusion: { in: death_accuracies.keys },
                             presence: { message: 'death accuracy required' }
  validates :beatification_accuracy, inclusion: { in: beatification_accuracies.keys },
                                     presence: { message: 'beatification accuracy required' }
  validates :canonization_accuracy, inclusion: { in: canonization_accuracies.keys },
                                    presence: { message: 'canonization accuracy required' }
  validates :title, inclusion: { in: titles.keys },
                                 presence: { message: 'title required' }
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
  
  def has_feast_day?
    feast_day.present?
  end

  def show_feast_day
    feast_day.strftime("%B %d")
  end

  def has_birthday?
    birth_date.present?
  end

  def has_birth_location?
    birth_location.present?
  end

  def has_deathday?
    death_date.present?
  end

  def has_death_location?
    death_location.present?
  end

  def has_beatification_date?
    beatification_date.present?
  end

  def has_canonization_date?
    canonization_date.present?
  end

  def accurate_birth_date
    case birth_accuracy
    when DATE_ACCURACIES.key(APPROX_YEAR)
      'c. ' + birth_date.strftime(YEAR_FORMAT)
    when DATE_ACCURACIES.key(EXACT_YEAR)
      birth_date.strftime(YEAR_FORMAT)
    when DATE_ACCURACIES.key(EXACT_MONTH_YEAR)
      birth_date.strftime(MONTH_YEAR_FORMAT)
    when DATE_ACCURACIES.key(EXACT_DATE)
      birth_date.strftime(MONTH_DAY_YEAR_FORMAT)
    end
  end

  def accurate_death_date
    case death_accuracy
    when DATE_ACCURACIES.key(APPROX_YEAR)
      'c. ' + death_date.strftime(YEAR_FORMAT)
    when DATE_ACCURACIES.key(EXACT_YEAR)
      death_date.strftime(YEAR_FORMAT)
    when DATE_ACCURACIES.key(EXACT_MONTH_YEAR)
      death_date.strftime(MONTH_YEAR_FORMAT)
    when DATE_ACCURACIES.key(EXACT_DATE)
      death_date.strftime(MONTH_DAY_YEAR_FORMAT)
    end
  end

  def accurate_beatification_date
    case beatification_accuracy
    when DATE_ACCURACIES.key(APPROX_YEAR)
      'c. ' + beatification_date.strftime(YEAR_FORMAT)
    when DATE_ACCURACIES.key(EXACT_YEAR)
      beatification_date.strftime(YEAR_FORMAT)
    when DATE_ACCURACIES.key(EXACT_MONTH_YEAR)
      beatification_date.strftime(MONTH_YEAR_FORMAT)
    when DATE_ACCURACIES.key(EXACT_DATE)
      beatification_date.strftime(MONTH_DAY_YEAR_FORMAT)
    end
  end

  def accurate_canonization_date
    case canonization_accuracy
    when DATE_ACCURACIES.key(APPROX_YEAR)
      'c. ' + canonization_date.strftime(YEAR_FORMAT)
    when DATE_ACCURACIES.key(EXACT_YEAR)
      canonization_date.strftime(YEAR_FORMAT)
    when DATE_ACCURACIES.key(EXACT_MONTH_YEAR)
      canonization_date.strftime(MONTH_YEAR_FORMAT)
    when DATE_ACCURACIES.key(EXACT_DATE)
      canonization_date.strftime(MONTH_DAY_YEAR_FORMAT)
    end
  end
end
