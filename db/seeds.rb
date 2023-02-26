# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning database..."
Movie.destroy_all
List.destroy_all

puts "Creating movies..."

10.times do |n|
  Movie.create!(
    title: Faker::Movie.title.capitalize,
    overview: Faker::Movie.quote,
    poster_url: Faker::Internet.url,
    rating: rand(0..10)
  )
  puts "created movie number #{n}"
end

  List.create!(name: 'Favorite movies')
  List.create!(name: 'Worst movies')
  List.create!(name: 'Friend recommendations')
  List.create!(name: 'Must watch')
  List.create!(name: 'Good mood movies')


puts "done with creating movies and lists"
