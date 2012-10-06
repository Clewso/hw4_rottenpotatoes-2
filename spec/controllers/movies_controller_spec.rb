require 'spec_helper'

describe MoviesController do
  describe 'movies with same directors' do
    it 'should call the model method that performs same directors query' do
      fake_res = [mock('movie1')]
      Movie.should_receive(:find_sim_dir).with(1).and_return(fake_res)
      post :same_dir, {:id => 1}
    end
    it 'should select the same directors template for rendering' do
    end
    it 'should make the same directors results availabe to that template' do
    end
  end
end
