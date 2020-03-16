module Mutations
  class CreateLibrary < BaseMutation
    argument :title, String, required: true

    field :library, Types::LibraryType, null: false
    field :errors, [String], null: false

    def resolve(title:)
      library = Library.new(title: title)
      if library.save
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