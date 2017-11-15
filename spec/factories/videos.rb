FactoryGirl.define do
  factory :videos do
    title "MyString"
    video_key 1
    description "MyString"
    video_image "MyString"
    release_date "2017-08-24"
    video_storage_path "MyString"
    user
    publisher
    comedian
    category
  end
end


