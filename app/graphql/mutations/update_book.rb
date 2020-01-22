module Mutations
  class UpdateBook < BaseMutation
    argument :author_id, ID, required: true
    argument :id, ID, required: true
    argument :title, String, required: true
    argument :genre, String, required: true

    field :book, Types::BookType, null: false
    field :errors, [String], null: false

    def resolve(author_id:, id:, title:, genre:)
      author = Author.find_by(id: author_id)
      book = author.books.find_by(id: id)
      if book.update(title: title, genre: genre)
        {
            book: book,
            errors: []
        }
      else
        {
            book: nil,
            errors: book.errors.full_messages
        }
      end
    end
  end
end
