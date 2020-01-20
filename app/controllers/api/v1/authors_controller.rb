module Api
  module V1
    class AuthorsController < ApplicationController
      def index
        @authors = Author.all
      end

      def show
        @author = Author.find_by(id: params[:id])
      end
    end
  end
end
