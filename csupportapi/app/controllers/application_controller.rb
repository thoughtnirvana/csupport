class ApplicationController < ActionController::API
  #Rails comes with CSRF prevention by raising an exception.
  #This will make token auth fail when accessed via the API.
  # protect_from_forgery with: :null_session
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :roles_mask])
  end
end
