Given(/^I select "([^"]*)" as the  "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I select "([^"]*)" from "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end


Given(/^the following publishers exist$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:publisher, hash)
  end
end

Given(/^the following comedians exist$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:comedian, hash)
  end
end

Given(/^the following categories exist$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:category, hash)
  end
end


