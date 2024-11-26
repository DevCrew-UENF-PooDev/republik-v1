class PostagensController < ApplicationController
  def new
    @postagem = Postagem.new
  end

  def create
    postagem = current_usuario.postagens.create(params_postagem)
    postagem.data_publicacao = Time.now
    if postagem.save
      redirect_to root_path
    end
  end

  private

  def params_postagem
    params.require(:postagem).permit(:titulo, :conteudo)
  end
end