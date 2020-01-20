require 'faker'
10.times do
  author = Author.create!(name: Faker::Book.author)
  author.books.create!(title: Faker::Book.title, genre: Faker::Book.genre)
end