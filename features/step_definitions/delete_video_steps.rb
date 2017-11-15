Given(/^the following video exist$/) do |table|
  table.hashes.each do |hash|
    hash["comedian_id"] = Comedian.find_by(name: hash["comedian_name"])
    hash["publisher_id"] = Publisher.find_by(publisher_name: hash["publisher_name"])
    hash["category_id"] = Category.find_by(category_name: hash["category_name"])
    hash.delete("publisher_name")
    hash.delete("category_name")
    hash.delete("comedian_name")
    FactoryGirl.create(:video, hash)
    # Video.create(hash)
  end
end


