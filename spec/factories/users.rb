# Faker::Config.locale = :ja

FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(8)
    sequence(:name) { |n| "#{Faker::Movies::StarWars.character}#{n}" }
    email { Faker::Internet.email }
    description { Faker::Lorem.characters(number: 20) }
    password { password }
    password_confirmation { password }
  end
end
