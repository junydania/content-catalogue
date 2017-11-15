FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    first_name "OJ"
    last_name "Dania"
    password "12345678"
    password_confirmation "12345678"
    role { User.roles.keys.sample }
  end
end
