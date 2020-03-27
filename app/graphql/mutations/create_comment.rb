module Mutations
  class CreateComment < BaseMutation
    argument :content, String, required: true
    argument :book_id, String, required: true

    field :comment, Types::CommentType, null: false
    field :errors, [String], null: false
    field :book_id, String, null: false

    def resolve(content:, book_id:)
      book = Book.find_by(id: book_id)
      comment = book.comments.create!(content: content)
      if comment
        {
            book_id: book_id,
            comment: comment,
            errors: []
        }
      else
        {
            errors: comment.errors.full_messages
        }
      end
    end
  end
end
