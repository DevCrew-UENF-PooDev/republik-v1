class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_usuario!
  before_action :usuario_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:username, :nome, :curso, :instituicao]
    devise_parameter_sanitizer.permit :account_update, keys: [:username, :nome, :curso, :instituicao]
  end
end
