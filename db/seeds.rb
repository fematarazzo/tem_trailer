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
Reservation.destroy_all



user = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "teste@teste.com",
  password: "teste123",
  phone_number: "1234567",
)
user.save!

10.times do
  date = DateTime.new(2021,rand(1..12),rand(1..28))
  trailer = Trailer.new(
    user_id: user.id,
    model: "#{Faker::Vehicle.manufacture} #{Faker::Vehicle.model}",
    description: "Lorem ipsum dolor sit amet",
    price: rand(1000..5000),
    onboard_capacity: rand(1..8),
    address: Faker::Address.state
  )

  trailer.save!

  5.times do
    reservation = Reservation.create(
      user_id: user.id,
      trailer_id: trailer.id,
      start_date: date,
      end_date: date + 10
    )
    date = date + 30
  end
end


