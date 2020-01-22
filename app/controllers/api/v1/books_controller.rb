module Api
  module V1
    class BooksController < ApplicationController
      #before_action :find_author
      #before_action :find_book, only: %i[update show destroy]

      def index
        query_string = "{
            allBooks(authorId: #{params[:author_id]}){
              id
              title
              author{
                id
                name
              }
            }
        }"
        result = RestRailsSchema.execute(query_string)
        render plain: result.to_h["data"].to_s
      end

      def create
        query_string = "mutation {
 createBook(input: {
authorId: #{params[:author_id]}
    title: #{params[:title]}
genre: #{params[:genre]}

 }) {
   book {
     id
        title
        genre
        author{
            id
            name
        }
   }
   errors
 }
}"
        result = RestRailsSchema.execute(query_string)
        render plain: result.to_h.to_s
      end

      def update
        query_string = "mutation {
 updateBook(input: {
authorId: #{params[:author_id]}
   id: #{params[:id]}
    title: #{params[:title]}
genre: #{params[:genre]}

 }) {
   book {
     id
        title
        genre
        author{
            id
            name
        }
   }
   errors
 }
}"
        result = RestRailsSchema.execute(query_string)
        render plain: result.to_h.to_s
      end

      def show
        query_string = "{
            book(authorId: #{params[:author_id]},id: #{params[:id]}){
              id
              title
              author{
                id
                name
              }
            }
        }"
        result = RestRailsSchema.execute(query_string)
        render plain: result.to_h["data"].to_s
      end

      def destroy
        query_string = "mutation {
 deleteBook(input: {
authorId: #{params[:author_id]}
   id: #{params[:id]}

 }) {
   errors
 }
}"
        result = RestRailsSchema.execute(query_string)
        render plain: result.to_h.to_s
      end

      private

      def find_author
        @author = Author.find_by(id: params[:author_id])
      end

      def find_book
        @book = @author.books.find_by(id: params[:id])
      end

      def book_params
        params.permit(:title, :genre)
      end
    end
  end
end