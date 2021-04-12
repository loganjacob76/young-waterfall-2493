require 'rails_helper'

RSpec.describe Actor do
    # before :each do
    #     @
    # end

    describe 'relationships' do
        it { should have_many :movie_actors }
        it { should have_many :movies }
    end
end