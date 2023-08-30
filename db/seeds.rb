# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Comment.destroy_all
Article.destroy_all
User.destroy_all

# generate 10 users
10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "123456")
end

# generate 10 articles
40.times do |id|
  Article.create!(
      title: Faker::Book.title,
      content: Faker::Quotes::Shakespeare.king_richard_iii_quote,
      user_id: rand(User.first.id..User.last.id)
  )
end

(1..10).each do |id|
  Comment.create!(
      content: Faker::Quote.famous_last_words,
      user_id: rand(User.first.id..User.last.id),
      article_id: rand(Article.first.id..Article.last.id)
  )
end
