class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    if current_user.present?
      current_user.apply_omniauth(request.env["omniauth.auth"])
      cookies[:user_id] = current_user.id
      cookies[:name] = current_user.email
      # redirect_to edit_user_registration_path, notice: "Facebook Account Linked!"
    else
      puts cookies[:user_id]
      @user = User.from_omniauth(request.env["omniauth.auth"])
      cookies[:user_id] = @user.id
      cookies[:name] = @user.email
      sign_in_and_redirect @user
    end
  end

  def google_oauth2
    if current_user.present?
      cookies[:user_id] = current_user.id
      cookies[:name] = current_user.email
      current_user.apply_omniauth(request.env["omniauth.auth"])
    else
      @user = User.from_omniauth(request.env["omniauth.auth"])
      cookies[:user_id] = @user.id
      cookies[:name] = @user.email
      sign_in_and_redirect @user
      #session["devise.google_data"] = request.env["omniauth.auth"]
    end
  end
end