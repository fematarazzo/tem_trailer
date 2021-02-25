require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Trailer.destroy_all
User.destroy_all

user = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "teste@teste.com",
  password: "teste123",
  phone_number: "1234567",
  )
user.save!

10.times do
  trailer = Trailer.new(
    user_id: user.id,
    model: "#{Faker::Vehicle.manufacture} #{Faker::Vehicle.model}",
    description: "Lorem ipsum dolor sit amet",
    price: rand(50000..400000),
    onboard_capacity: rand(2..8),
    address: Faker::Address.state
    )

  trailer.save!

  puts "Trailer do #{user.first_name} foi criado"

end
