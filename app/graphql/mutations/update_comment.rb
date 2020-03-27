module Mutations
  class UpdateComment < BaseMutation
    argument :id, ID, required: true
    argument :content, String, required: true

    field :comment, Types::CommentType, null: false
    field :errors, [String], null: false

    def resolve(id:, content:)
      comment = Comment.find_by(id: id)
      if comment.update(content: content)
        {
            comment: comment,
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
