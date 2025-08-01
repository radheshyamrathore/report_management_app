class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:admin])
  end
  
  def admin_required
    redirect_to root_path, alert: 'Access denied.' unless current_user&.admin?
  end
end