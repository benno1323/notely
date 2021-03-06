# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Note.destroy_all
User.destroy_all

5.times do |i|
	user = User.create!(email: "user#{i}@gmail.com", password: "12345678", password_confirmation: "12345678")
	2.times do |j|
		Note.create!(title: "Note #{j}", content: "Content of Note #{j}", share: false, user: user)
	end
end