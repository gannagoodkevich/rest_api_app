module Mutations
  class CreateAuthor < BaseMutation
    argument :name, String, required: true

    field :author, Types::AuthorType, null: false
    field :errors, [String], null: false

    def resolve(name:)
      author = Author.new(name: name)
      if author.save
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
