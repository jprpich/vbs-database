50.times do 
    Child.create({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: Faker::Number.number(1), identification: Faker::Number.number(8), parent_id: Faker::Number.between(1, 10) })
  end
    