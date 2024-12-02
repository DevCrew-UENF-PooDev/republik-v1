class PostagensController < ApplicationController
  def new
    @postagem = Postagem.new
  end

  def destroy
    @post = Postagem.find(params[:id])
    if @post
      @post.delete_post(current_usuario)
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def params_postagem
    params.require(:postagem).permit(:titulo, :conteudo, imagens: [])
  end
end
