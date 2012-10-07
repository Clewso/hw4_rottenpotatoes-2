require "spec_helper"

describe MoviesHelper do
  describe '#oddness' do
    it 'correctly returns oddness' do
      helper.oddness(5).should == "odd"
    end
  end
end

