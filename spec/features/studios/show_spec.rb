require 'rails_helper'

RSpec.describe 'shelters show page' do
    before :each do
        @studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
        @movie1 = @studio1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
        @actor1 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: false)
        @actor2 = Actor.create!(name: 'John Rhys-Davies', age: 76, currently_working: false)

        MovieActor.create!(movie: @movie1, actor: @actor1)
        MovieActor.create!(movie: @movie1, actor: @actor2)
    end

    describe 'when I visit a studio show page' do
        it 'has the studio name, location, and all movies' do
            visit "/studios/#{@studio1.id}"
            
            expect(page).to have_content(@studio1.name)
            expect(page).to have_content(@studio1.location)
            expect(page).to have_content(@movie1.title)
        end
        
        it 'has all actors in all movies in order by age descending' do
            visit "/studios/#{@studio1.id}"
            
            expect(@actor1.name).to appear_before(@actor2.name)
        end
    end
end