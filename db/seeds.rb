require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

19.times do |i|
  Item.create!(title: Faker::Cat.name, description: Faker::FamilyGuy.quote, price: rand(1..10), image_url: 'cats/small/cat_' + sprintf('%04d' , i+1) + '.png')
end

2.times do
  aba = User.create!(email: Faker::Internet.email, password: "loliloli")
  Cart.create!(user_id: aba.id, total_price: "$100")
end

50.times do
  CartItem.create!(item_id: Item.order("RANDOM()").first.id, cart_id: Cart.order("RANDOM()").first.id)
end
