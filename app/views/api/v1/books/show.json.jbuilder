json.id @book.id
json.title @book.title
json.genre @book.genre
json.author_url api_v1_author_path(@book.author)