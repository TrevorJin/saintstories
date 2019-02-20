FactoryBot.define do
  factory :saint_photo do
    photo_priority { 100 }
    width { 777 }
    height { 777 }
    saint

    trait :has_image do
      photo { 'PictureOfSaint' }
      photo_caption { 'This is a picture of a saint.' }
      photo_description { 'This is a picture of a saint.' }
      photo_alternative_text { 'This is a picture of a saint.' }
    end
  end
end
