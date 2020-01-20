module Api
  module V1
    class AuthorsController < ApplicationController
      def index
        @authors = Author.all
      end

      def edit

      end

      def create
        @author = Author.new(author_params)
        @author.save!
      end

      def show
        @author = Author.find_by(id: params[:id])
      end

      private

      def author_params
        params.permit(:name)
      end
    end
  end
end
