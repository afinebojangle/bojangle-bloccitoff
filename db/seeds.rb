require 'faker'

10.times do
  user = User.new(
    first_name:    Faker::Lorem.word,
    last_name:     Faker::Lorem.word,
    email:         Faker::Internet.email,
    password:      Faker::Lorem.characters(8)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

10.times do
  list = List.new(
    title:    Faker::Lorem.sentence,
    user_id:     users.sample
    )
end
lists = List.all

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
  