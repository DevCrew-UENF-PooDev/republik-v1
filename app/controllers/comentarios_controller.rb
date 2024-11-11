class ComentariosController < ApplicationController
  before_action :authenticate_usuario!

  def create
    @postagem = Postagem.find(params[:postagem_id])
    @comentario = @postagem.comentarios.build(comentario_params)
    @comentario.usuario = current_usuario

    if @comentario.save
      flash[:notice] = "Comentário adicionado com sucesso!"
    else
      flash[:alert] = "Não foi possível adicionar o comentário."
    end
    redirect_to postagem_path(@postagem)
  end

  private

  def comentario_params
    params.require(:comentario).permit(:conteudo)
  end
end
