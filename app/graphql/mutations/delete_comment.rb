module Mutations
  class DeleteComment < BaseMutation
    argument :id, ID, required: true

    field :comment, Types::CommentType, null: false
    field :errors, [String], null: false
    field :id, String, null: false
    field :book_id, String, null: false

    def resolve(id:)
      comment = Comment.find_by(id: id)
      book_id = comment.book.id
      if comment.delete
        {
            book_id: book_id,
            id: id,
            errors: []
        }
      else
        {
            errors: author.errors.full_messages
        }
      end
    end
  end
end