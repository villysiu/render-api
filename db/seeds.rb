# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Photo.destroy_all
u=User.create!(email:"mickey@disney.com", name:"mickey", password:'password')
# p=Photo.create!(desc: 'something', url: 'a link', user_id: u.id)
# Comment.create!(comment: "love", user_id: u.id, photo_id: p.id)