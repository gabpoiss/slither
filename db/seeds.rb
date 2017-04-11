# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Snake.create(name: Faker::Pokemon.name, breed: Faker::Cat.breed, sex:  "Male", available: true, price: Faker::Commerce.price, user_id: 1)
end
