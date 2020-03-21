module Types
  class MutationType < Types::BaseObject
    field :create_book, mutation: Mutations::CreateBook
    field :update_book, mutation: Mutations::UpdateBook
    field :delete_book, mutation: Mutations::DeleteBook

    field :delete_author, mutation: Mutations::DeleteAuthor
    field :update_author, mutation: Mutations::UpdateAuthor
    field :create_author, mutation: Mutations::CreateAuthor

    field :create_library, mutation: Mutations::CreateLibrary
    field :delete_library, mutation: Mutations::DeleteLibrary
    field :update_library, mutation: Mutations::UpdateLibrary
    field :create_book_for_library, mutation: Mutations::CreateBookForLibrary
  end
end
