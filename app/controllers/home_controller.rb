class HomeController < ApplicationController
  def index
    # Carregar todas as comunidades
    @comunidades = Comunidade.all
    # Também carregar as comunidades em que o usuário participa
    @comunidades_participadas = current_usuario.comunidades.pluck(:id)
    @postagens = Postagem.all
  end
end
