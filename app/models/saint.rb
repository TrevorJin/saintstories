class Saint < ApplicationRecord
	validates :name, presence: { message: "name required" },
									 length: { maximum: 255, message: "must be 255 characters or less" }
	validates :gender, presence: { message: "gender required" }
	validates :feast_day, presence: { message: "feast day required" }
	validates :birth_date, presence: { message: "date of birth required" }
	validates :birth_accuracy, presence: { message: "birth accuracy required" }
	validates :death_date, presence: { message: "date of death required" }
	validates :death_accuracy, presence: { message: "death accuracy required" }
	validates :birth_location, presence: { message: "birth location required" },
														 length: { maximum: 255, message: "must be 255 characters or less" }
	validates :death_location, presence: { message: "death location" },
														 length: { maximum: 255, message: "must be 255 characters or less" }
	validates :beatification_date, presence: { message: "beatification date required" }
	validates :canonization_date, presence: { message: "canonization date required" }
	validates :birth_latitude, presence: { message: "birth latitude required" }
	validates :birth_longitude, presence: { message: "birth longitude required" }
	validates :death_latitude, presence: { message: "death latitude required" }
	validates :death_longitude, presence: { message: "death longitude required" }
end
