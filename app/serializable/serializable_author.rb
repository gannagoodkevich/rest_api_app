class SerializableAuthor < JSONAPI::Serializable::Resource
  type 'authors'
  attribute :name
  attribute :book_id
  attribute :created_at
  attribute :updated_at
  has_many :books do
    meta do
      { count: @object.books.count,
        content: @object.books }
    end
  end
end
