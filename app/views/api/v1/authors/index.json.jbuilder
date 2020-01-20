json.authors do
  json.partial! partial: 'api/v1/authors/author', collection: @authors, as: :author
end
