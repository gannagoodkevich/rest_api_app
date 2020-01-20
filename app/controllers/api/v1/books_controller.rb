module Api
  module V1
    class BooksController < ApplicationController
      def index
        @author = Author.find_by(id: params[:author_id])
        @books = @author.books.order('created_at DESC')
      end

      def show
        @author = Author.find_by(id: params[:author_id])
        @book = @author.books.find_by(id: params[:id])
      end
    end
  end
end