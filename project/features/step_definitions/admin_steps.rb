Given /^I am a staff user$/ do
end

When /^I log in to the admin$/ do
  visit('/admin/')
  fill_in 'Username', :with => 'test'
  fill_in 'Password', :with => 'test'
  click_button 'Log in'
end

Then /^I should see the admin index page$/ do
  current_path.should == '/admin/'
  page.should have_content('Welcome, test')
  page.should have_content('Site administration')
end
