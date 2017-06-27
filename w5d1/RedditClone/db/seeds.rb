# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Sub.destroy_all
Post.destroy_all
PostSub.destroy_all

5.times do
  User.create(username: Faker::Internet.email, password: Faker::Internet.password(6))
end

7.times do
  Sub.create(title: Faker::Lorem.word, description: Faker::Lorem.sentence, user_id: rand(1..5))
  Post.create(title: Faker::Lorem.word, url: Faker::Internet.url, content: Faker::Lorem.paragraph, user_id: rand(1..5)) # sub_id: rand(1..7)
end

15.times do
  PostSub.create(post_id: rand(1..7), sub_id: rand(1..7))
end
