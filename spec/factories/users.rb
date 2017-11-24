FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    first_name "OJ"
    last_name "Dania"
    password "12345678"
    password_confirmation "12345678"
    role { User.roles.keys.sample }


    factory :administrator do
      after(:create) {|user| user.role = 'administrator'}
    end

    factory :standard do
      after(:create) {|user| user.role = 'standard'}
    end

    factory :guest do
      after(:create) {|user| user.role = 'guest'}
    end

  end
end

