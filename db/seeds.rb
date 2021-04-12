# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all
Studio.destroy_all
Actor.destroy_all
MovieActor.destroy_all

studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
studio2 = Studio.create!(name: 'Lucasfilm Ltd.', location: 'San Francisco')

movie1 = studio1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
movie2 = studio2.movies.create!(title: 'A New Hope', creation_year: 1977, genre: 'Sci-fi')

actor1 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: false)
actor2 = Actor.create!(name: 'John Rhys-Davies', age: 76, currently_working: false)
actor3 = Actor.create!(name: 'James Earl Jones', age: 90, currently_working: true)

MovieActor.create!(movie: movie1, actor: actor1)
MovieActor.create!(movie: movie1, actor: actor2)
MovieActor.create!(movie: movie2, actor: actor1)
MovieActor.create!(movie: movie2, actor: actor3)