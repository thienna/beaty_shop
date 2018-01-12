puts "Creating Users"
User.create! name: "Mike",
  email: "ng.anhthien@gmail.com",
  number: "0123456789",
  password: "123456",
  is_admin: true

unless Rails.env == "production"
  puts "Creating Categories"
  categories = ["Eyes", "Lips", "Face & Body", "Nails"]
  categories.each do |category|
    Category.create! name: category,
      description: Faker::Hacker.say_something_smart
  end

  puts "Creating Products"
  10.times do |i|
    Product.create!(name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      price: Faker::Commerce.price,
      quantity: i * 5,
      price_sale: i * 2).category_ids = Category.pluck(:id).sample 3
  end
end
