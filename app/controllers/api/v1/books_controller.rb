module Api
  module V1
    class BooksController < ApplicationController
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
        render plain: result(query_string)
      end

      def create
        query_string = "mutation {
                          createBook(input: {
                            authorId: #{params[:author_id]}
                            title: #{params[:title]}
                            genre: #{params[:genre]}
                          })
                          {
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
        render plain: result(query_string)
      end

      def update
        query_string = "mutation {
                          updateBook(input: {
                            authorId: #{params[:author_id]}
                            id: #{params[:id]}
                            title: #{params[:title]}
                            genre: #{params[:genre]}
                          })
                          {
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
        render plain: result(query_string)
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
        render plain: result(query_string)
      end

      def destroy
        query_string = "mutation {
                          deleteBook(input: {
                            authorId: #{params[:author_id]}
                            id: #{params[:id]}
                          })
                          {
                             errors
                          }
                        }"
        render plain: result(query_string)
      end

      private

      def result(query_string)
        RestRailsSchema.execute(query_string).to_h.to_s
      end
    end
  end
end