FactoryBot.define do
  factory :room do
    name { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.characters(number: 20) }
    price { rand(100..9999)}
    address { Faker::Address.city }
    new_room_img { Faker::Avatar.image }
  end
end
