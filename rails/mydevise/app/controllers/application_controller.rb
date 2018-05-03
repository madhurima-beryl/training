class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])#for(:sign_up) << :name
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # helper for view
  helper_method :current_user 

end
