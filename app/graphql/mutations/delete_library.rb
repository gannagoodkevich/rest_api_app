module Mutations
  class DeleteLibrary < BaseMutation
    argument :id, ID, required: true

    field :library, Types::LibraryType, null: false
    field :id, String, null: false
    field :errors, [String], null: false

    def resolve(id:)
      library = Library.find_by(id: id)
      if library.delete
        {
            id: id,
            errors: []
        }
      else
        {
            errors: library.errors.full_messages
        }
      end
    end
  end
end
