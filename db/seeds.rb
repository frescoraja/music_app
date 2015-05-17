# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
bools = ["true", "false"]

User.create(email: "david@aa.io", password: "password")

50.times do
  User.create(email: Faker::Internet.email, password: Faker::Internet.password)
end

100.times do
  Band.create(name: Faker::Company.name.concat("s #{Faker::Name.name}"))
end

500.times do
  Album.create(title: Faker::Lorem.sentence(rand(1..5)), band_id: rand(1..100), year: rand(1945..2015), live: bools[rand(2)] )
end

500.times do |album_id|
  rand(6..17).times do |ord|
    Track.create(track_title: Faker::Lorem.sentence(rand(1..7)), album_id: album_id, ord: (ord + 1), lyrics: Faker::Lorem.paragraph(rand(4..12)), bonus: bools[rand(2)] )
  end
end

1000.times do
  Note.create(user_id: rand(1..50), track_id: rand(1..Track.count), content: Faker::Lorem.paragraph(rand(1..3)))
end
