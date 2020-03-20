module Mutations
  class DeleteBook < BaseMutation
    argument :author_id, ID, required: true
    argument :id, ID, required: true

    field :id, String, null: false
    field :book, Types::BookType, null: false
    field :errors, [String], null: false

    def resolve(author_id:, id:)
      author = Author.find_by(id: author_id)
      if author.books.find_by(id: id).delete
        {
          id: id,
          errors: []
        }
      else
        {
          errors: "Error!!!"
        }
      end
    end
  end
end
