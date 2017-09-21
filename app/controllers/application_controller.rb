class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def restrict_service_providers
    redirect_to jobs_path unless current_user.is_consumer?
  end

  def restrict_consumers
    redirect_to consumers_jobs_path if current_user.is_consumer?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:type])
  end
end
