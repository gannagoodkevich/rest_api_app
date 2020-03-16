module Types
  class QueryType < Types::BaseObject
    field :all_authors,
          [Types::AuthorType],
          null: false,
          description: 'Returns a list of authors'

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
          null: false do
            argument :author_id, ID, required: true
          end
    def all_books(author_id:)
      Author.find_by(id: author_id).books
    end

    field :book, Types::BookType, null: false do
      argument :author_id, Integer, required: true
      argument :id, Integer, required: true
    end
    def book(author_id:, id:)
      author = Author.find_by(id: author_id)
      author.books.find_by(id: id)
    end

    field :all_libraries,
          [Types::LibraryType],
          null: false,
          description: 'Returns a list of ligraries'

    def all_libraries
      Library.all
    end

    field :library, Types::LibraryType, null: false do
      argument :id, ID, required: true
    end
    def library(id:)
      Library.find_by(id: id)
    end
  end
end
