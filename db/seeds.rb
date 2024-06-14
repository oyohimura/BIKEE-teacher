# destroy all content of the database
Rent.destroy_all
Bike.destroy_all
User.destroy_all

# generate 2 users with first_name and last_name using the Faker gem
i = 0
2.times do
  user = User.new(
    email: "clara@gmail" + ["", "1"][i] + ".com",
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  user.save!
  i += 1
  # for each user, create between 1 and 3 bikes with a brand, a model and a price (integer) and
  # a user_id (the id of the user created above)
  rand(1..3).times do
    bike = Bike.new(
      brand: %w[Decathlon Fisherprice Trek].sample,
      model: Faker::Vehicle.model,
      price: rand(10..50),
      user_id: user.id
    )
    bike.save!
    # for each bike, create a booking with a start_date and a duration (integer, in days)
    # and a bike_id (the id of the bike created above) and a user_id (the id of the user created above)
    rent = Rent.new(
      start_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
      duration: rand(1..10),
      bike_id: bike.id,
      user_id: user.id
    )
    rent.save!
  end
end
