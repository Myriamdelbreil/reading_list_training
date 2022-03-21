# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

Review.destroy_all
puts "Reviews destroyed"
Article.destroy_all
puts "Articles destroyed"
User.destroy_all
puts "Users destroyed"

10.times do
  email = Faker::Internet.email
  username = Faker::Internet.username
  password = "123456"
  user = User.create(email: email, username: username, password: password)
end

puts "Users created. Now articles"

User.all.each do |user|
  title = Faker::Book.title
  content = "#{Faker::Lorem.paragraph_by_chars} #{Faker::Lorem.paragraph_by_chars}"
  description = Faker::Lorem.sentence(word_count: 3)
  article = Article.create(user: user, content: content, title: title, description: description)
end

puts "Articles created. Now reviews"

Article.all.each do |article|
  user = User.all.sample
  title = Faker::Lorem.word
  content = Faker::Lorem.sentence
  review = Review.create(title: title, content: content, user: user, article: article)
end

puts "reviews created!"
