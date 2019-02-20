FactoryBot.define do
  factory :timeline_event do
    event_priority { 100 }
    event_title { 'Born in Wadowice, Poland' }
    event_time { 'May 18th, 1920' }
    event_description { 'Karol is born to Karol and Emilia Wojtyła
                       in Wadowice near Kraków, Poland. He is the
                       youngest of three children.' }
    saint

    trait :has_image do
      image { 'PictureOfSaint' }
      image_caption { 'This is a picture of a saint.' }
      image_description { 'This is a picture of a saint.' }
      image_alternative_text { 'This is a picture of a saint.' }
    end
  end
end
