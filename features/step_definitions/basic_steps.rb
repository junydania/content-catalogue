Given(/^the following user account exist$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:user, hash)
  end
end

Given(/^I am on the landing page$/) do
  visit root_path
end


Given(/^I am on the "([^"]*)" page$/) do |sign_in|
  visit("/users/#{sign_in}")
end


Given(/^I click on "([^"]*)"$/) do |login|
  click_link_or_button(login)
end

Given(/^I fill in field "([^"]*)" with "([^"]*)"$/) do |email, password|
  fill_in email, with: password
end

def check_email(email, negate, subject, body = nil)
  unless negate
    expect(ActionMailer::Base.deliveries.size).to eq 1
    expect(ActionMailer::Base.deliveries[0].subject).to include(subject)
    expect(ActionMailer::Base.deliveries[0].body).to include(body) unless body.nil?
    expect(ActionMailer::Base.deliveries[0].to).to include(email) unless email.nil?
  else
    expect(ActionMailer::Base.deliveries.size).to eq 0
  end
end


When(/^I click on the retrieve password link in the last email$/) do
  password_reset_link = ActionMailer::Base.deliveries.last.body.match(
      /<a href=\"(.+)\">Change my password<\/a>/
  )[1]

  visit password_reset_link
end

Given(/^I should receive a "([^"]*)" email$/) do |subject|
  expect(ActionMailer::Base.deliveries.size).to eq 1
  expect(ActionMailer::Base.deliveries[0].subject).to include(subject)
end


Then(/^I fill in "([^"]*)" with "([^"]*)"$/) do |new_password, password|
  fill_in new_password, with: password
end

Then(/^I click "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be on the "([^"]*)" page$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end