class HomeController < ApplicationController
  def index
    if params[:query].present?
      @comunidades = Comunidade.where("nome LIKE ?", "%#{params[:query]}%")
    else
      @comunidades = Comunidade.all
    end

    @comunidades_participadas = current_usuario.comunidades.pluck(:id)
    @postagens = Postagem.all
  end
end
