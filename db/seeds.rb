require 'faker'

10.times do
  user = User.new(
    first_name:    Faker::Name.first_name,
    last_name:     Faker::Name.last_name,
    email:         Faker::Internet.email,
    password:      Faker::Lorem.characters(8)
    )
  user.skip_confirmation!
  user.save!
  
  list = user.build_list(
    title:         Faker::Lorem.sentence
    )
  list.save!
end


user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email:    'afinebojangle@gmail.com',
  password: 'helloworld',
  first_name:  'Rayford',
  last_name:   'Taylor'
  )

puts "Seed Finished"
puts "#{User.count} users were created"
puts "#{List.count} lists were created"
  