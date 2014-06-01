# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Lorem.words(6).join('-') }
  end

  factory :confirmed_user do
    email { Faker::Internet.email }
    password { Faker::Lorem.words(6).join('-') }
    after(:build) { |user| user.confirm! }
  end
end