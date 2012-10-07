require 'spec_helper'

describe MoviesController do
  describe 'movies with same directors' do
    it 'should call the model method that performs same directors query' do
      fake_results = [ mock('movie1')]
      Movie.create(:title => 'test', :director => 'test_director')
      controller.should_receive(:same_dir)
      get 'same_dir', {:id => 1}
    end
    it 'should select the same directors template for rendering' do
      fake_results = [ mock('movie1')]
      Movie.create(:title => 'test', :director => 'test_director')
      Movie.stub(:find_sim_dir).and_return(fake_results)
      get 'same_dir', {:id => 1}
      response.should render_template('same_dir')
    end
    it 'should make the same directors results availabe to that template' do
      fake_results = [mock('movie1')]
      Movie.create(:title => 'test', :director => 'test_director')
      Movie.stub(:find_sim_dir).and_return(fake_results)
      get 'same_dir', {:id => 1}
      assigns(:sim_dir).should == fake_results
    end
  end

  describe 'show movies controller' do
    it 'should sort by title' do
      get 'index', {:ratings => "G", :sort => "title"}
    end

    it ' should update a movie' do
      Movie.create(:title => 'test', :id => 1)
      put :update, :id => 1, :movie => {:title=> 'changed'}
    end
    it 'should have diff params then session' do
#      @select_ratings = {'G'}
      get 'index', {}
    end
    it 'should sort by release date' do
      get 'index', {:release_date => Time.now, :sort => "release_date"}
    end

    it 'should create new movie' do
      post :create, {:id => 1}
    end

    it 'should get ' do
      controller.should_receive(:same_dir)
      get :same_dir
    end
    it 'should check if no directors' do
      Movie.create(:title => 'test', :director => 'test_dir', :id => 1)
      get :same_dir, {:id => 1}
      response.should redirect_to(movies_path)
    end
    it 'should destroy a movie' do
      Movie.create(:title => 'test', :director => 'test_dir', :id => 1)
      delete :destroy, {:id => 1}
      Movie.count.should == 0
    end

    it 'controller should show' do
      Movie.create(:title => 'test', :director => 'test_dir', :id => 1)
      get 'show', {:id=>1}
    end

  end
end

