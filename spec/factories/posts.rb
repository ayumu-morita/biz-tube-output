FactoryBot.define do
  factory :post do
    text {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    question1 {Faker::Lorem.sentence}
    question2 {Faker::Lorem.sentence}
    association :user 
  end
end
