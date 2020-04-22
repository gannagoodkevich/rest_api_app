class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :set_cors, only: :passthru

  def set_cors
    puts "Eeey"
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end

  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    puts "You are in google auth!!!"
    if @user.persisted?
      sign_in @user, :event => :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
    end
    redirect_to '/'
  end

  def facebook
    if current_user.present?
      current_user.apply_omniauth(request.env["omniauth.auth"])
      redirect_to edit_user_registration_path, notice: "Facebook Account Linked!"
    else
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in_and_redirect @user
    end
  end
end