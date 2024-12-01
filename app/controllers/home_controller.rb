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

  def perform_search
    @query = params[:query]
    @comunidades = Comunidade.where("nome LIKE ?", "%#{@query}%")
    @usuarios = Usuario.where("(username LIKE ? OR nome LIKE ?) and id <> ?", "%#{@query}%", "%#{@query}%", current_usuario.id)

    respond_to do |format|
      format.html { redirect_to search_path, notice: "Comunidades Pesquisadas." }
      format.turbo_stream
    end
  end

  def send_friend_request
    @desired_friend = Usuario.find(params[:id])
    current_status = current_usuario.friend_status(@desired_friend)

    case current_status
    when :request_received
      if params[:action_type] == "accept"
        current_usuario.accept_friend_request(@desired_friend)
      else
        current_usuario.decline_friend_request(@desired_friend)
      end
    when :request_sent
      current_usuario.cancel_friend_request(@desired_friend)
    when :not_friends
      current_usuario.send_friend_request(@desired_friend)
    when :friends
      current_usuario.decline_friend_request(@desired_friend)
      current_usuario.cancel_friend_request(@desired_friend)
    end

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.turbo_stream
    end
  end
end
