module Api
  module V1
    class AuthorsController < ApplicationController
      def index
        query_string = "{ allAuthors{
                            id
                            name
                            books{
                                id
                                title
                                genre
                            }
                          }
                        }"
        render json: result(query_string)
      end

      def update
        query_string = "mutation {
                          updateAuthor(input: {
                            id: #{params[:id]}
                             name: #{params[:name]}
                          })
                          {
                            author {
                              id
                              name
                              books{
                                  id
                                  title
                                  genre
                              }
                            }
                            errors
                          }
                        }"
        render json: result(query_string)
      end

      def create
        query_string = "mutation {
                          createAuthor(input: {
                            name: #{params[:name]}
                          })
                          {
                            author {
                              id
                              name
                            }
                            errors
                          }
                        }"
        render json: result(query_string)
      end

      def show
        query_string = "{ author(id: #{params[:id]}){
                            id
                            name
                            books{
                                id
                                title
                                genre
                            }
                          }
                        }"
        render json: result(query_string)
      end

      def destroy
        query_string = "mutation {
                          deleteAuthor(input: {
                              id: #{params[:id]}
                          })
                          {
                           errors
                          }
                        }"
        render json: result(query_string)
      end

      private

      def result(query_string)
        RestRailsSchema.execute(query_string).to_h.to_s
      end
    end
  end
end
