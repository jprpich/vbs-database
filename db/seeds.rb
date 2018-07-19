# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Dir[File.join(Rails.root, 'db', 'seeds/*', '*.rb')].sort.each do |seed|
#   load seed
# end

#  

115.times do 
  Parent.create(
    {
      first_name: Faker::FunnyName.name, 
      last_name: Faker::FunnyName.name, 
      phone: Faker::Number.number(10), 
      email: Faker::Internet.email, 
      church: Faker::Team.name, 
      amount_paid: Faker::Number.number(6)
    }
  )
end


200.times do 
  parent = Parent.all.sample
  Child.create(
    {
      first_name: Faker::Name.first_name, 
      last_name: Faker::Name.last_name, 
      age: Faker::Number.number(1), 
      identification: Faker::Number.number(8), 
      health_provider: Faker::Coffee.origin, 
      parent_id: parent.id
    }
  )
end

40.times do 
  CrewLeader.create(
    {
      first_name: Faker::FunnyName.name, 
      last_name: Faker::FunnyName.name, 
      phone: Faker::Number.number(10), 
      email: Faker::Internet.email, 
      church: Faker::Team.name, 
    }
  )
end


    