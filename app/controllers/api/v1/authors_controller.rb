module Api
  module V1
    class AuthorsController < ApplicationController
      before_action :find_author, except: %i[index create]

      def index
        render json: AuthorSerializer.new(Author.all)
      end

      def update
        author_error if @author.nil?

        @author.update!(author_params)
        render json: AuthorSerializer.new(@author)
      end

      def create
        @author = Author.new(author_params)
        @author.save!
        render json: AuthorSerializer.new(@author)
      end

      def show
        return author_error if @author.nil?

        render json: AuthorSerializer.new(@author)
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
