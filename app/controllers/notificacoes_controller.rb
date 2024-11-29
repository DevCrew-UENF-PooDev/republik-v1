class NotificacoesController < ApplicationController
  def index
    @notificacoes = current_usuario.notificacoes.nao_lidas.order(created_at: :desc)
  end

  def marcar_como_lida
    @notificacao = Notificacao.find(params[:id])
    @notificacao.marcar_como_lida
    redirect_to notificacoes_path
  end
end
