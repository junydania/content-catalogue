Given(/^the following user account exist$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:user, hash)
  end
end

Given(/^I am on the landing page$/) do
  visit root_path
end

Given(/^I click on "([^"]*)"$/) do |login|
  click_link_or_button(login)
end

Given(/^I fill in field "([^"]*)" with "([^"]*)"$/) do |email, password|
  fill_in email, with: password
end

