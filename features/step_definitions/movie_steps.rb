Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
end

 When /^(?:|I )go to the edit page for "(.*)"/ do |movie|
  movie    = Movie.find(:first, :conditions => {:title => movie})
  visit edit_movie_path(movie)
end


And /I fill in "(.*)" with "(.*)"/ do |field, value|
  fill_in(field, :with => value)
end

And /I press "(.*)"/ do |button|
  click_button(button)
end

Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
  movie    = Movie.find(:first, :conditions => {:title => movie})
  movie.director.should == director
end

Given /I am on the details page for "(.*)"/ do |movie|
  movie    = Movie.find(:first, :conditions => {:title => movie})
  visit movie_path(movie)
end

When /I follow "(.*)"/ do |link|
  click_link(link)
end

Then /^(?:|I )should not see "(.*)"/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end
