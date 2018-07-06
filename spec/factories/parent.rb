FactoryGirl.define do
  factory :parent do
    name { Faker::Lorem.word }
    email { Faker::Internet.email }
    phone { Faker::Number.number(10) }
    amount_paid { Faker::Number.number(6) }
  end
end
