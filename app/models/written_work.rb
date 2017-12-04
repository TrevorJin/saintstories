class WrittenWork < ApplicationRecord
  belongs_to :saint
  validates :saint_id, presence: true
  validates :title, presence: true, length: { maximum: 300 }
  validates :publication_date, presence: true
  validates :publication_accuracy, presence: true
end
