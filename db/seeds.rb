5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

users = User.all

5.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Overwatch.location,
    body: Faker::HitchhikersGuideToTheGalaxy.quote
  )
end

wikis = Wiki.all

puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "Seed finished"