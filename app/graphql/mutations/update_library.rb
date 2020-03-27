module Mutations
  class UpdateLibrary < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: true

    field :library, Types::LibraryType, null: false
    field :errors, [String], null: false

    def resolve(id:, title:)
      library = Library.find_by(id: id)
      if library.update(title: title)
        {
            library: library,
            errors: []
        }
      else
        {
            library: nil,
            errors: library.errors.full_messages
        }
      end
    end
  end
end
