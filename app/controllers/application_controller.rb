class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_usuario!
  before_action :usuario_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :atualizar_ultimo_acesso

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [ :username, :nome, :curso, :instituicao, :avatar ]
    devise_parameter_sanitizer.permit :account_update, keys: [ :username, :nome, :curso, :instituicao, :avatar ]
  end

  private

  def atualizar_ultimo_acesso
    return unless current_usuario
    current_usuario.update(ultima_vez_visto_em: Time.current)
  end
end
