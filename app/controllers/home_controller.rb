class HomeController < ApplicationController
  def index
    @comunidades = Comunidade.all
    @comunidades_participadas = current_usuario.comunidades.pluck(:id)
    @postagens = Postagem.all
  end

  def search_community
    @communities = if params[:query].present?
      Comunidade.where("nome LIKE ?", "%#{params[:query]}%")
    else
      Comunidade.all
    end

    @comunidades_participadas = current_usuario.comunidades.pluck(:id)

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Comunidades Pesquisadas." }
      format.turbo_stream
    end
  end
end
