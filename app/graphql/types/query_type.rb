module Types
  class QueryType < Types::BaseObject
    field :authors,
          [Types::AuthorType],
          null: false,
          description: "Returns a list of authors"

    def authors
      Author.all
    end
  end
end
