module Mutations
  class DeleteComment < BaseMutation
    argument :id, ID, required: true

    field :comment, Types::CommentType, null: false
    field :errors, [String], null: false
    field :id, String, null: false

    def resolve(id:)
      comment = Comment.find_by(id: id)
      if comment.delete
        {
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