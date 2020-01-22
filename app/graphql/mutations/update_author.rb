module Mutations
  class UpdateAuthor < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: true

    field :author, Types::AuthorType, null: false
    field :errors, [String], null: false

    def resolve(id:, name:)
      author = Author.find_by(id: id)
      if author.update(name: name)
        {
            author: author,
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
