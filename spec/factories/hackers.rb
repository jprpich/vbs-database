FactoryGirl.define do
  factory :hacker do
    email {Faker::Internet.email}
    password {Devise.friendly_token.first(8)}
  end

end
