user_names = %w(Joe Obama Nancy Trump Ivanca Mike LinWood)

user_names.each do |user_name|
  User.create(
    name: user_name,
    email: "#{user_name}@example.com",
    description: Faker::Lorem.characters(number: 100),
    password: "testpassword",
    password_confirmation: "testpassword"
  )
end
