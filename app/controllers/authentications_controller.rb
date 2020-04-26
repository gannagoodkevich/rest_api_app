class AuthenticationsController < ApplicationController
  def destroy
    current_user = User.find_by(id: params[:user_id])
    current_user.update_attributes(provider: nil, uid: nil)
    cookies[:user_id] = "Hello"
  end
end