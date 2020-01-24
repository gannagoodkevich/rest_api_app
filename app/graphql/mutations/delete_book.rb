module Mutations
  class DeleteBook < BaseMutation
    argument :author_id, ID, required: true
    argument :id, ID, required: true

    field :book, Types::BookType, null: false
    field :errors, [String], null: false

    def resolve(author_id:, id:)
      author = Author.find_by(id: author_id)
      if author.books.find_by(id: id).delete
        {
          errors: []
        }
      else
        {
          errors: author.errors.full_messages
        }
      end
    end
  end
end
