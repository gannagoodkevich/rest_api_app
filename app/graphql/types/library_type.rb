module Types
  class LibraryType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :books, [Types::BookType], null: true
  end
end