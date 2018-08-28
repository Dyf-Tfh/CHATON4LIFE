require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  Item.create!(title: Faker::Hacker.noun, description: Faker::Hacker.say_something_smart, price: rand(1..10), image_url: Faker::Internet.url)
end

2.times do
  aba = User.create!(email: Faker::Internet.email, password: "loliloli")
  Cart.create!(user_id: aba.id, total_price: "$100")
end

50.times do |i|
  CartItem.create!(item_id: Item.order("RANDOM()").first.id, cart_id: Cart.order("RANDOM()").first.id)
end
