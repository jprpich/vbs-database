FactoryGirl.define do
  factory :parent do
    first_name { Faker::Lorem.word }
    last_name { Faker::Lorem.word }
    email { Faker::Internet.email }
    phone { Faker::Number.number(10) }
    amount_paid { Faker::Number.number(6) }
  end
end
