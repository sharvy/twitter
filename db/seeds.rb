# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create some dummy users and tweets
5.times do
  params = {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  }

  user = User.create!(params)
  Tweet.create!(text: Faker::Quote.famous_last_words, user: user)
end

# Create dummy comment
Tweet.last.comments.create(text: Faker::Quote.famous_last_words, user: User.first)

# Create test user John Doe
User.create!(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: '123456')
