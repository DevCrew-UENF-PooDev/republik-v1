class HomeController < ApplicationController
  def index
    @comunidades = current_usuario.comunidades
    @postagens = Postagem.all
  end
end
