require 'spec_helper'
require 'rails_helper'

describe MoviesController do
  
  describe 'create a movie' do
    it 'should create a new movie' do
      post :create, {:movie=>{:title=>"Deadpool", :rating=>"R"}}
      response.should redirect_to movies_path
      expect(flash[:notice]).to be_present
    end
  end
  
  describe 'delete a movie' do
    it 'should delete a new movie' do
      movie = Movie.create!(:title=>"Deadpool", :rating=>"R")
      delete :destroy, {:id=>movie.id}
      response.should redirect_to movies_path
    end
  end
  
  describe 'search directors' do
    before :each do
      @movie1 = Movie.create!(:title=>'title1', :director=>'director1')
      @movie2 = Movie.create!(:title=>'title2', :director=>'director1')
      @movie3 = Movie.create!(:title=>'title3')
    end
    
    it 'should search movies by directors' do
      get :search_directors, {:movie_id=>@movie1.id}
      flash[:notice].should_not be_present
    end
    
    it 'should redirect to movies path if no director provided' do
      get :search_directors, {:movie_id=>@movie3.id}
      response.should redirect_to movies_path
      flash[:notice].should be_present
    end
  end

end