
Given(/^I select "([^"]*)" from "([^"]*)"$/) do |choice, options|
  select(choice, from: options)
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


When(/^I fill in "([^"]*)" date field with "([^"]*)"$/) do |field_name, date_components|
  label = find("label", text: field_name)
  select_base_id = label[:for]
  date_components.split(",").each_with_index do |value, index|
    select value.strip, from: "#{select_base_id}_#{index+1}i"
    end
end

When(/^I attach file "([^"]*)" to field "([^"]*)"$/) do |file, image|
  attach_file(Image, '/path/to/image.jpg')
end

When(/^I attach file "([^"]*)" in the image field$/) do |file|
  attach_file("Video Thumbnail", File.join(Rails.root, file))
end



