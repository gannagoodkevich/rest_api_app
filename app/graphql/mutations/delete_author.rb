module Mutations
  class DeleteAuthor < BaseMutation
    argument :id, ID, required: true

    field :author, Types::AuthorType, null: false
    field :errors, [String], null: false
    field :id, String, null: false

    def resolve(id:)
      author = Author.find_by(id: id)
      author.books.each(&:delete)
      if author.delete
        {
            id: id,
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
