module Types
  class MutationType < Types::BaseObject
    field :delete_author, mutation: Mutations::DeleteAuthor
    field :update_author, mutation: Mutations::UpdateAuthor
    field :create_author, mutation: Mutations::CreateAuthor
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
