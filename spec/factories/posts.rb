FactoryBot.define do
  factory :post do
    text {Faker::Lorem.sentence}
    image {'bJLIIFYP1a4'}
    question1 {Faker::Lorem.sentence}
    question2 {Faker::Lorem.sentence}
    association :user 
  end
end
