Given(/^the following video exist$/) do |table|
  table.hashes.each do |hash|
    comedian = Comedian.find_by(name: hash["comedian_name"])
    hash["comedian_id"] = comedian.id
    publisher = Publisher.find_by(publisher_name: hash["publisher_name"])
    hash["publisher_id"] = publisher.id
    category = Category.find_by(category_name: hash["category_name"])
    hash["category_id"] = category.id
    hash.delete("publisher_name")
    hash.delete("category_name")
    hash.delete("comedian_name")
    Video.create(hash)
  end
end




