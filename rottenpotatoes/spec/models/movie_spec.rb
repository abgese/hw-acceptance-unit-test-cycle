require 'rails_helper'

describe "similar_movies" do
        it "should find movies having the same director" do
            movieA=Movie.create! :director => 'Dummy Director 1'
            movieB=Movie.create! :director => 'Dummy Director 1'
            expect(movieA.similar_movies).to include(movieB)
        end
        it "should not find movies by different directors" do
            movieA=Movie.create! :director => 'Dummy Director 1'
            movieB=Movie.create! :director => 'Dummy Director 2'
            expect(movieA.similar_movies).not_to include(movieB)
        end
    end