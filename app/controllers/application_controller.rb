class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def page_not_found
    redirect_to("/404")
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
  		:first_name, :last_name, :email, 
  		:password, :password_confirmation,
  		:is_buyer, :is_seller)}
  end
end
