class BookSerializer
  include FastJsonapi::ObjectSerializer

  belongs_to :author
  set_id :id
  attributes :title, :genre
end
