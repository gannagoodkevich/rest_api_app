module Api
  module V1
    class BooksController < ApplicationController
      before_action :find_author
      before_action :find_book, only: %i[update show destroy] 

      def index
        return author_error if @author.nil?

        render jsonapi: @author.books,
               fields: { authors: %i[title genre created_at updated_at] }
      end

      def create
        return author_error if @author.nil?

        @book = @author.books.create!(book_params)
        render jsonapi: @book
      end

      def update
        return author_error if @author.nil?

        return book_error if @book.nil?

        @book.update(book_params)
        render jsonapi: @book
      end

      def show
        return author_error if @author.nil?

        book_error if @book.nil?

        render jsonapi: @book
      end

      def destroy
        return author_error if @author.nil?

        return book_error if @book.nil?

        @book.destroy
      end

      private

      def find_author
        @author = Author.find_by(id: params[:author_id])
      end

      def find_book
        @book = @author.books.find_by(id: params[:id])
      end

      def book_params
        params.permit(:title, :genre)
      end
    end
  end
end