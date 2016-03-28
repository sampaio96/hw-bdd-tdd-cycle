require 'spec_helper'
require 'rails_helper'

describe Movie do
  
  describe 'all ratings' do
    it 'should have correct rating list' do
      Movie.all_ratings.should include("G", "PG", "PG-13", "NC-17", "R")
    end
  end
  
end