ActiveRecord::Base.transaction do
  puts "Creating Users"
  User.delete_all
  users = [User.new(name: "Mike",
    email: "ng.anhthien@gmail.com",
    number: "0123456789",
    password: "123456",
    is_admin: true)]
  User.import! users

  unless Rails.env == "production"
    puts "Creating Categories"
    Category.destroy_all
    categories = Array.new
    categories_name = ["Eyes", "Lips", "Face & Body", "Nails"]
    categories_name.each do |category|
      categories << Category.new(name: category,
        description: Faker::Hacker.say_something_smart)
    end
    Category.import! categories

    puts "Creating Products"
    Product.destroy_all
    10.times do |i|
      Product.create(name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph,
        price: Faker::Commerce.price,
        quantity: i + 2,
        price_sale: i * 2).category_ids = Category.pluck(:id).sample(3)
    end

    puts "Creating Orders"
    Order.destroy_all
    orders = Array.new
    15.times do
      orders << Order.new(customer_name: Faker::LeagueOfLegends.champion,
        customer_address: Faker::LeagueOfLegends.location,
        customer_email: Faker::Internet.email,
        customer_phone: Faker::PhoneNumber.cell_phone)
    end
    Order.import! orders

    puts "Creating Order Details"
    OrderDetail.delete_all
    order_details = Array.new
    Order.all.each do |order|
      3.times do |i|
        product = Product.all.sample
        order_details << OrderDetail.new(product_id: product.id,
          order_id: order.id,
          quantity: i + 1,
          unit_price: product.price * i)
      end
    end
    OrderDetail.import! order_details
  end
end
