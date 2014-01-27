class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :profile_name, :remember_me) }
    devise_parameter_sanitizer.for(:user) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :profile_name, :remember_me) }  
  end

  def create
    @user = User.create( user_params )
  end

  private
  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def user_params
	 params.require(:user).permit(:avatar)
  end

  def user_friendship_params
    params.require(:user_friendship).permit(:user, :friend, :user_id, :friend_id)

end
