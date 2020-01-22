module Api
  module V1
    class AuthorsController < ApplicationController
      before_action :find_author, except: %i[index create]

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
        render plain: result.to_h["data"]["allAuthors"].to_s
      end

      def update
        return author_error if @author.nil?

        @author.update!(author_params)
      end

      def create
        @author = Author.new(author_params)
        @author.save!
      end
#TODO add error handling!!!
      def show
        author_error if @author.nil?
        render plain: @author.to_h["data"]["author"].to_s
      end

      def destroy
        return author_error if @author.nil?

        @author.destroy!
      end

      private

      def find_author
        query_string = "{ author(id: #{params[:id]}){
        id
        name
        books{
            id
            title
            genre
        }
    }}"
        result = RestRailsSchema.execute(query_string)
        @author = result
      end

      def author_params
        params.permit(:name)
      end
    end
  end
end
