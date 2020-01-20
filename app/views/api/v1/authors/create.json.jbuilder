json.author do
  json.id @author.id
  json.name @author.name
  json.books do
    json.array! @author.books
  end
end