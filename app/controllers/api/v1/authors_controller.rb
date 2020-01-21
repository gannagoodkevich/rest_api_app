module Api
  module V1
    class AuthorsController < ApplicationController
      before_action :find_author, except: %i[index create]

      def index
        @authors = Author.all
      end

      def update
        return author_error if @author.nil?

        @author.update!(author_params)
      end

      def create
        @author = Author.new(author_params)
        @author.save!
      end

      def show
        author_error if @author.nil?
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
