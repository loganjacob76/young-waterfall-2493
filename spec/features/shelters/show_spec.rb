require 'rails_helper'

RSpec.describe 'shelters show page' do
    before :each do
        @studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
        @movie1 = @studio1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    end

    describe 'when I visit a studio show page' do
        it 'has the studio name, location, and all movies' do
            visit "/studios/#{@studio.id}"

            expect(page).to have_content(@studio1.name)
            expect(page).to have_content(@studio1.location)
            expect(page).to have_content(@movie1.title)
        end
    end
end