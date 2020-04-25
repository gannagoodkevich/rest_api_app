class ApplicationController < ActionController::API
  #include DeviseTokenAuth::Concerns::SetUserByToken
  include ::ActionController::Cookies

  before_action :set_cookie

  def set_cookie
    #session[:user] = "Hello World"
    puts request.cookies[:user_id].inspect
  end

  def author_error
    render json: 'Error: there is no such author. Check author_id'
  end

  def book_error
    render json: 'Error: there is no such book. Check book_id'
  end
end
