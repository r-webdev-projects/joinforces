# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

99.times do |n|
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	username = Faker::Internet.user_name
	location = Faker::Address.city
	short_bio = Faker::Hacker.say_something_smart
	email = "example-#{n+1}@example.org"
	password = "password"
	User.create!(first_name: first_name,
							 last_name: last_name,
							 username: username,
							 location: location,
							 short_bio: short_bio,
							 email: email,
							 password: password,
							 password_confirmation: password)
end

50.times do |n|
	title = Faker::Hacker.ingverb
	description = Faker::Hacker.say_something_smart
	user_id = n+1
	Idea.create!(title: title,
							 description: description,
							 user_id: user_id)
end