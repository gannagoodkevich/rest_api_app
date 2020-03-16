module Types
  class MutationType < Types::BaseObject
    field :create_book, mutation: Mutations::CreateBook
    field :update_book, mutation: Mutations::UpdateBook
    field :delete_book, mutation: Mutations::DeleteBook

    field :delete_author, mutation: Mutations::DeleteAuthor
    field :update_author, mutation: Mutations::UpdateAuthor
    field :create_author, mutation: Mutations::CreateAuthor

    field :create_library, mutation: Mutations::CreateLibrary
  end
end
