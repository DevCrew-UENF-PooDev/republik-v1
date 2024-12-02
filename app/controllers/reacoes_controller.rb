class ReacoesController < ApplicationController
  before_action :authenticate_usuario!

  def create
    @postagem = Postagem.find(params[:postagem_id])
    @reacao = @postagem.reacoes.find_or_initialize_by(usuario: current_usuario)

    if @reacao.persisted? && @reacao.tipo == params[:tipo]
      @reacao.destroy # Remove a reação existente se for do mesmo tipo
    else
      @reacao.update(tipo: params[:tipo]) # Atualiza ou cria a reação
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  private

  def params_postagem
    params.require(:reacaos).permit(:tipo)
  end
end
