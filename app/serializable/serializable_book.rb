class SerializableBook < JSONAPI::Serializable::Resource
  type 'books'
  attribute :title
  attribute :genre
  attribute :created_at
  attribute :updated_at
  belongs_to :author do
    meta do
      { author: @object.author }
    end
  end
end
