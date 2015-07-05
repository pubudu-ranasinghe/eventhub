class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_devise_parameters, if: :devise_controller?

  protected
  def configure_devise_parameters
    devise_parameter_sanitizer.for(:sign_up) << :f_name
    devise_parameter_sanitizer.for(:account_update) << :f_name
    devise_parameter_sanitizer.for(:sign_up) << :l_name
    devise_parameter_sanitizer.for(:account_update) << :l_name
  end
end
