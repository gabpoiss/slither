# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "martingianna@gmail.com", password: "123456", username: "martingianna", first_name: "martin", last_name: "gianna")
User.create(email: "bobby@gmail.com", password: "123456", username: "billybob", first_name: "billy", last_name: "bob")


7.times do
  Snake.create(name: Faker::Pokemon.name, breed: Faker::Cat.breed, sex:  "Male", available: true, price: Faker::Commerce.price, user_id: 1)
end

7.times do
  Snake.create(name: Faker::Pokemon.name, breed: Faker::Cat.breed, sex:  "Male", available: true, price: Faker::Commerce.price, user_id: 2)
end
