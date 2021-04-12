require 'rails_helper'

RSpec.describe Studio do
  before :each do
    @studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @movie1 = @studio1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @actor1 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: false)
    @actor2 = Actor.create!(name: 'John Rhys-Davies', age: 76, currently_working: false)

    MovieActor.create!(movie: @movie1, actor: @actor1)
    MovieActor.create!(movie: @movie1, actor: @actor2)
  end

  describe 'relationships' do
    it {should have_many :movies}
  end

  describe 'instance methods' do
    describe '.all_actors' do
      it 'returns a list of actors that have acted in any of the studios movies ordered by age in descending order' do
        expect(@studio1.all_actors).to eq([@actor1.name, @actor2.name])
      end
    end
  end
end
