class Saint < ApplicationRecord
  APPROX_YEAR = 0
  EXACT_YEAR = 1
  EXACT_MONTH_YEAR = 2
  EXACT_DATE = 3
  YEAR_FORMAT = "%-Y"
  MONTH_YEAR_FORMAT = "%B %-Y"
  MONTH_DAY_YEAR_FORMAT = "%B %d, %-Y"
  DATE_ACCURACIES = {
    'We only know the approximate year.' => APPROX_YEAR,
    'We only know the exact year.' => EXACT_YEAR,
    'We only know the exact month and year.' => EXACT_MONTH_YEAR,
    'We know the exact day, month, and year.' => EXACT_DATE
    }.freeze
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
  validates :birth_accuracy, inclusion: { in: birth_accuracies.keys },
                             presence: { message: 'birth accuracy required' }
  validates :death_accuracy, inclusion: { in: death_accuracies.keys },
                             presence: { message: 'death accuracy required' }
  validates :birth_location,
    length: { maximum: 255, message: 'must be 255 characters or less' }
  validates :death_location,
    length: { maximum: 255, message: 'must be 255 characters or less' }
  # validates :beatification_accuracy, inclusion: { in: beatification_accuracies.keys }
  # validates :canonization_accuracy, inclusion: { in: canonization_accuracies.keys }
  validates :short_description, presence: { message: 'short description required' }
  validates :long_description, presence: { message: 'long description required' }
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

  def accurate_saint_date(date_type)
    saint_date = birth_date
    date_accuracy = 0
    case date_type
    when 'birth'
      saint_date = birth_date
      date_accuracy = birth_accuracy
    when 'death'
      saint_date = death_date
      date_accuracy = death_accuracy
    when 'beatification'
      saint_date = beatification_date
      date_accuracy = beatification_accuracy
    when 'canonization'
      saint_date = canonization_date
      date_accuracy = canonization_accuracy
    end
    apply_accuracy(saint_date, date_accuracy)
  end

  private

  def apply_accuracy(saint_date, date_accuracy)
    case date_accuracy
    when DATE_ACCURACIES.key(APPROX_YEAR)
      'c. ' + saint_date.strftime(YEAR_FORMAT)
    when DATE_ACCURACIES.key(EXACT_YEAR)
      saint_date.strftime(YEAR_FORMAT)
    when DATE_ACCURACIES.key(EXACT_MONTH_YEAR)
      saint_date.strftime(MONTH_YEAR_FORMAT)
    when DATE_ACCURACIES.key(EXACT_DATE)
      saint_date.strftime(MONTH_DAY_YEAR_FORMAT)
    end
  end
end
