module Api
  module V1
    class AuthorsController < ApplicationController
      before_action :find_author, except: %i[index create]

      def index
        render jsonapi: Author.all,
               fields: { authors: %i[name created_at updated_at] }
      end

      def update
        author_error if @author.nil?

        @author.update!(author_params)
        render jsonapi: @author
      end

      def create
        @author = Author.new(author_params)
        @author.save!
        render jsonapi: @author
      end

      def show
        return author_error if @author.nil?

        render jsonapi: @author
      end

      def destroy
        return author_error if @author.nil?

        @author.destroy!
      end

      private

      def find_author
        @author = Author.find_by(id: params[:id])
      end

      def author_params
        params.permit(:name)
      end
    end
  end
end
