class ApplicationController < ActionController::API
  def author_error
    render json: 'Error: there is no such author. Check author_id'
  end

  def book_error
    render json: 'Error: there is no such book. Check book_id'
  end
end
