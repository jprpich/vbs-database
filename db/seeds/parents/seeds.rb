 200.times do 
    Parent.create({name: Faker::FunnyName.name, phone: Faker::Number.number(10), email: Faker::Internet.email, church: Faker::Team.name, amount_paid: Faker::Number.number(6)})
  end
    