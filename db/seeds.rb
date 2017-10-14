50.times do
    Wiki.create!(
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph
    )
end
wikis = Wiki.all

10.times do
    User.create!(
        name: Faker::Name.unique.name,
        email: Faker::Internet.unique.email,
        password: Faker::Lorem.characters(6)
    )
end
users = User.all
    
    
    puts "Seed finished"
    puts "#{Wiki.count} wikis created"
    puts  "#{User.count} users created"