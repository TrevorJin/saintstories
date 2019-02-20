FactoryBot.define do
  factory :written_work do
    title { 'An Introduction to the Devout Life' }
    publication_date { Date.new(2017, 8, 14) }
    publication_accuracy { 3 }
    saint
  end
end
