class HomeController < ApplicationController
  def index
    @comunidades = Comunidade.all
    @comunidades_participadas = current_usuario.comunidades
    @postagens = Postagem.all
  end

  def search
    @comunidades = Comunidade.all
    @usuarios = Usuario.where("id <> ?", current_usuario.id)
  end

  def search_community
    @query = params[:query]
    if @query.present?
      @comunidades = Comunidade.where("nome LIKE ?", "%#{@query}%")
      @usuarios = Usuario.where("(username LIKE ? OR nome LIKE ?) and id <> ?", "%#{@query}%", "%#{@query}%", current_usuario.id)
    else
      @comunidades = []
      @usuarios = []
    end

    # Renderiza a página de resultados
    respond_to do |format|
      format.html { redirect_to search_path, notice: "Comunidades Pesquisadas." }
      format.turbo_stream
    end
  end

  def send_friend_request
    @desired_friend = Usuario.find(params[:id])
    if current_usuario.seguindo_usuarios.include?(@desired_friend)
      @current_usuario.seguindo_usuarios.delete(@desired_friend)
      @action = :send_friend_request
    else
      current_usuario.seguindo_usuarios << @desired_friend
      current_usuario.enviar_notificacao("foi seguido", @desired_friend)
      @action = :cancel_friend_request
    end

    respond_to do |format|
      format.html { redirect_to search_path, notice: "Sua participação foi atualizada." }
      format.turbo_stream
    end
  end
end
