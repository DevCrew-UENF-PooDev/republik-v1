class ReacoesController < ApplicationController
  before_action :authenticate_usuario!

  def create
    @postagem = Postagem.find(params[:postagem_id])
    @reacao = @postagem.reacoes.find_by(usuario: current_usuario)

    if @reacao
      @reacao.destroy
      flash[:notice] = "Reação Removida"
    else
      @reacao = @postagem.reacoes.build(tipo: params[:tipo], usuario: current_usuario)
      if @reacao.save
        flash[:notice] = "Reação Computada"
        if @postagem.usuario != current_usuario
          @postagem.enviar_notificacao("reagiu", @postagem.usuario)
        end
      else
        flash[:notice] = "Erro ao adicionar reação"
      end
    end
    redirect_to root_path
  end

  private

  def params_postagem
    params.require(:reacaos).permit(:tipo)
  end
end
