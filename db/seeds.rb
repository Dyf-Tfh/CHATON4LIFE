# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p = 0
5.times do
  User.create!(email: "nico#{p}@hotmail.fr", password: "loliloli")

  Cart.create!(user_id: "1", total_price: "100")

  Item.create!(title: "savage cat", description:"brown color", price:"200", image_url:"https://www.google.fr/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=2ahUKEwiP5LyUwo_dAhXEKVAKHfoDAWUQjRx6BAgBEAU&url=https%3A%2F%2Fwamiz.com%2Fchats%2Factu%2Fa-26-ans-corduroy-est-le-chat-le-plus-age-du-monde-6724.html&psig=AOvVaw3c8zgj0GDGJ1mIlP70vA9S&ust=1535537786939610" )
p += 1
end
