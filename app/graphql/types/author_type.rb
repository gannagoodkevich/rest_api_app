module Types
  class AuthorType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :books_count, Integer, null: false
    field :books, [Types::BookType], null: true
  end
end
