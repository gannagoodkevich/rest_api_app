class AuthorSerializer
  include FastJsonapi::ObjectSerializer

  has_many :books
  set_id :id
  attributes :name
end
