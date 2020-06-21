class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #우리는 username을 name으로 받는다
    devise_parameter_sanitizer.permit(:account_update, keys: [:name]) #우리는 username을 name으로 받는다
  end
end
