module Api
  module V1
    class LibrariesController < ApplicationController
      def index
        query_string = "{ allLibraries{
                            id
                            title
                            books{
                              id
                              title
                            }
                          }
                        }"
        render plain: result(query_string)
      end

      def create
        query_string = "mutation {
                          createLibrary(input: {
                            title: #{params[:title]}
                          })
                          {
                            library {
                              id
                              title
                            }
                            errors
                          }
                        }"
        render plain: result(query_string)
      end

      def update
        query_string = "mutation {
                          updateLibrary(input: {
                            id: #{params[:id]}
                            title: #{params[:title]}
                          })
                          {
                            library {
                              id
                              title
                              books{
                                id
                                title
                              }
                            }
                            errors
                           }
                        }"
        render plain: result(query_string)
      end

      def show
        query_string = "{
                          library(id: #{params[:id]}){
                            id
                            title
                            books{
                              id
                              title
                              genre
                            }
                          }
                        }"
        render plain: result(query_string)
      end

      def destroy
        query_string = "mutation {
                          deleteLibrary(input: {
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
