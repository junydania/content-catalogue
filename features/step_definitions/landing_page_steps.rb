Given(/^I visit the landing page$/) do
  visit root_path
end

Then(/^I should see "([^"]*)"$/) do |welcome|
  expect(page).to have_content(welcome)
end


Then(/^show page$/) do
  save_and_open_page
end