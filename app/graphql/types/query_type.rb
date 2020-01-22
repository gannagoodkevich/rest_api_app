module Types
  class QueryType < Types::BaseObject
    field :all_authors,
          [Types::AuthorType],
          null: false,
          description: "Returns a list of authors"

    def all_authors
      Author.all
    end

    field :author,  Types::AuthorType, null: false do
      argument :id, ID, required: true
    end
    def author(id:)
      Author.find_by(id: id)
    end

    field :all_books,
          [Types::BookType],
          null: false,
          description: "Returns a list of books"

    def all_books
      Book.all
    end
  end
end
