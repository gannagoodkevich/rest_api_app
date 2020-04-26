module Mutations
  class CreateLibrary < BaseMutation
    argument :title, String, required: true
    argument :user_id, String, required: true

    field :library, Types::LibraryType, null: false
    field :errors, [String], null: false

    def resolve(title:, user_id:)
      library = Library.new(title: title)
      if library.save
        User.find_by(id: user_id).libraries << library
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