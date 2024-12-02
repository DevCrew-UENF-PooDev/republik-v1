class ComunidadesController < ApplicationController
  def index
    @comunidades = Comunidade.where("nome LIKE ?", "%#{params[:query]}%") if params[:query].present?
    @comunidades ||= Comunidade.all

    respond_to do |format|
      format.html # Renderiza a página completa
      format.turbo_stream # Renderiza apenas o Turbo Frame
    end
  end

  def join
    @comunidade = Comunidade.find(params[:id])

    participation_status = @comunidade.participation_status(current_usuario)

    if participation_status == :community_not_participate
      @comunidade.enter_community(current_usuario)
    else
      @comunidade.remove_user_from_community(current_usuario)
    end

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.turbo_stream
    end
  end

  def show
    @comunidade = Comunidade.find_by(id: params[:id]) || current_usuario.comunidades.first
    @comunidades_participadas  = []
    @usuarios = []
    @posts = []
    if @comunidade.nil?
      return
    end
    @comunidades_participadas = current_usuario.comunidades
    @posts = @comunidade.posts
    @usuarios = @comunidade.usuarios
  end

  private

  def params_comunidade
    params.require(:comunidade).permit(:nome, :descricao, :avatar)
  end
end
