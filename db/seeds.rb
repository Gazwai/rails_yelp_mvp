# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Delete restaurants...'
Restaurant.destroy_all

puts 'Create 5 restaurants...'
5.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164
  )
end
puts 'finished creating restaurants'

puts 'Create 50 reviews...'
50.times do
  Review.create(
    content: Faker::Restaurant.review,
    rating: rand(0..5),
    restaurant_id: Restaurant.all.sample.id
  )
end
puts 'finished creating reviews'
