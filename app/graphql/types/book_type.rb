module Types
  class BookType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :genre, String, null: false
    field :author, Types::AuthorType, null: false
  end
end
