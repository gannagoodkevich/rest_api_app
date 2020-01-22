module Api
  module V1
    class AuthorsController < ApplicationController
      #TODO add error handling!!!

      #before_action :find_author, except: %i[index create]

      def index
        #@authors = Author.all
        query_string = "{ allAuthors{
        id
        name
        books{
            id
            title
            genre
        }
    } }"
        result = RestRailsSchema.execute(query_string)
        render plain: result.to_h["data"].to_s
      end

      def update
        query_string = "mutation {
 updateAuthor(input: {
   id: #{params[:id]}
    name: #{params[:name]}
 }) {
   author {
     id,
     name,
     books{
         id
         title
         genre
     }
   }
   errors
 }
}"
        result = RestRailsSchema.execute(query_string)
        render plain: result.to_h.to_s
      end

      def create
        query_string = "mutation {
 createAuthor(input: {
    name: #{params[:name]}
 }) {
   author {
     id,
     name,
     books{
         id
         title
         genre
     }
   }
   errors
 }
}"
        result = RestRailsSchema.execute(query_string)
        render plain: result.to_h.to_s
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
author_errors}"
        result = RestRailsSchema.execute(query_string)
        render plain: result.to_h["data"].to_s
      end

      def destroy
        query_string = "mutation {
 deleteAuthor(input: {
    id: #{params[:id]}
 }) {
   errors
 }
}"
        result = RestRailsSchema.execute(query_string)
        render plain: result.to_h.to_s
      end

      private
      def author_params
        params.permit(:name)
      end
    end
  end
end
