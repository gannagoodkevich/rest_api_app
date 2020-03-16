module Types
  class LibraryType < Types::BaseObject
    field :id, ID, null: false
    field :book, Types::BookType, null: false
  end
end