module Types
  class BookType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :genre, String, null: false
    field :author, Types::AuthorType, null: false
    field :comments, [Types::CommentType], null: false
  end
end
