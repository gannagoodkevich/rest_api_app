module Mutations
  class DeleteAuthor < BaseMutation
    argument :id, ID, required: true

    field :author, Types::AuthorType, null: false
    field :errors, [String], null: false

    def resolve(id:)
      author = Author.find_by(id: id)
      if author.delete
        {
            errors: []
        }
      else
        {
            author: nil,
            errors: author.errors.full_messages
        }
      end
    end
  end
end
