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
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
  )
end
topics = Topic.all

10.times do
  Article.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    topic: topics.sample,
    user: users.sample
  )
end
articles = Article.all

30.times do
  Comment.create!(
    body: Faker::Lorem.paragraph,
    article: articles.sample,
    user: users.sample
  )
end
comments = Comment.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Article.count} articles created"
puts "#{Comment.count} comments created"
