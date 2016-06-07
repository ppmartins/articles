require 'faker'

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end
users = User.all

5.times do
  Topic.create!(
    name: Faker::Name.name,
    description: Faker::Lorem.paragraph
  )
end
topics = Topic.all

10.times do
  Article.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    topic: topics.sample
  )
end
articles = Article.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Article.count} articles created"
