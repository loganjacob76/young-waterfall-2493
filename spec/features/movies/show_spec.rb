require 'rails_helper'

RSpec.describe 'movies show page' do
    before :each do
        studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
        @movie1 = studio1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
        @actor1 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: false)
        @actor2 = Actor.create!(name: 'John Rhys-Davies', age: 76, currently_working: false)
        
        MovieActor.create!(movie: @movie1, actor: @actor1)
        MovieActor.create!(movie: @movie1, actor: @actor2)
    end

    describe 'when i visit a movie show page' do
        it 'has title of movie, creation year, and genre' do
            visit "/movies/#{@movie1.id}"

            expect(page).to have_content(@movie1.title)
            expect(page).to have_content(@movie1.creation_year)
            expect(page).to have_content(@movie1.genre)
        end

        it 'has all actors in the movie' do
            visit "/movies/#{@movie1.id}"

            expect(page).to have_content(@actor1.name)
            expect(page).to have_content(@actor2.name)
        end
    end
end