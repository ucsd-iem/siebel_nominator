# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :nomination do
    email { Faker::Internet.email }
    password { Faker::Lorem.words(6).join('-') }
  end

  factory :complete_nomination do
  end
end