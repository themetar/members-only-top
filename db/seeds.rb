# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!( name:                  "User Userson",
              email:                 "user.s@example.com",
              password:              "password",
              password_confirmation: "password")

User.create!( name:                  "User McUser",
              email:                 "user.mc@example.com",
              password:              "password",
              password_confirmation: "password")

count = User.count
20.times do |i|
  post = Post.create!(author_id: rand(count) + 1,
                      text:      Faker::Quote.yoda)
  post.update_attribute(:created_at, (20-i).minutes.ago)
end
