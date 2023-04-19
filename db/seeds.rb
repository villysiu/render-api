# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Photo.destroy_all
p=Photo.create!(desc: 'something', url: 'a link', user_id: 1)
Comment.create!(comment: "love", user_id: 1, photo_id: p.id)