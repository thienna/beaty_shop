User.create! name: "Mike",
  email: "ng.anhthien@gmail.com",
  number: "0123456789",
  password: "123456",
  is_admin: true

categories = ["Eyes", "Lips", "Face & Body", "Nails"]
categories.each do |category|
  Category.create! name: category,
    description: Faker::Hacker.say_something_smart
end
