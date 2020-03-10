require 'rails_helper'

describe MoviesController do

    describe "director" do
        context "When movie in question has a director director field" do
            
            it "should find movies with matching director field" do
            
            @movie_id="1"
            @movie=double('fake_movie', :director => 'Bill Condon')
            
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
            expect(@movie).to receive(:similar_movies)
        
            get :director, :id => @movie_id
            
            expect(response).to render_template(:director)
        end
    end
        context "When movie in question has empty director field" do
            it "should redirect to the movies page" do
            @movie_id="1"
            @movie=double('fake_movie').as_null_object
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
            get :director, :id => @movie_id
            expect(response).to redirect_to(movies_path)
            
            end
        end
    end

  describe "create" do
    it "should create a new movie with entered details" do
        @movie_id = "1"
        @movie = double('fake movie').as_null_object
        @defaults = { :title => "Terrible Movie", :rating => "G", :director => "Dr. V" }
        expect(Movie).to receive(:create!).and_return(@movie)
        post :create, :movie => @defaults
        expect(response).to redirect_to(movies_path)
    end
  end
  describe "show" do
    it "should display the details of the movie that matches id" do
        @movie_id = "1"
        @movie = double('fake movie').as_null_object
        expect(Movie).to receive(:find).and_return(@movie)
        get :show, :id => @movie_id
        expect(response).to render_template(:show)
    end
  end
  describe "destroy" do
    it "should delete the movie that matches id" do
        @movie_id = "1"
        @movie = double('fake movie').as_null_object
        expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
        expect(@movie).to receive(:destroy)
        delete :destroy, :id => @movie_id
        expect(response).to redirect_to(movies_path)
    end
  end
  describe "edit" do
    it "should 'edit' the movie that matches id" do
        @movie_id = "1"
        @movie = double('fake movie').as_null_object
        expect(Movie).to receive(:find).and_return(@movie)
        get :edit, :id => @movie_id
        expect(response).to render_template(:edit)
    end
  end
  describe "new" do
    it "should render 'new' template" do
        # the new method doesn't actualy do anything besides render new.html.haml
        get :new 
        expect(response).to render_template(:new)
    end
  end
end