module Mutations
  class CreateBookForLibrary < BaseMutation
    argument :library_id, ID, required: true
    argument :author_id, ID, required: true
    argument :title, String, required: true
    argument :genre, String, required: true

    field :book, Types::BookType, null: false
    field :library_id, String, null: false
    field :errors, [String], null: false

    def resolve(library_id:, author_id:, title:, genre:)
      author = Author.find_by(id: author_id)
      book = author.books.new(title: title, genre: genre)
      if book.save
        Library.find_by(id: library_id).books << book
        {
            library_id: library_id,
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