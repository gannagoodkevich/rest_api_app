module Mutations
  class CreateBook < BaseMutation
    argument :author_id, ID, required: true
    argument :title, String, required: true
    argument :genre, String, required: true

    field :book, Types::BookType, null: false
    field :errors, [String], null: false

    def resolve(author_id:, title:, genre:)
      author = Author.find_by(id: author_id)
      book = author.books.new(title: title, genre: genre)
      if book.save
        {
          book: book,
          errors: []
        }
      else
        {
          author: nil,
          errors: book.errors.full_messages
        }
      end
    end
  end
end
