class SocialCommunityPostController < ApplicationController
  def new
    @postagem = Postagem.new
    @comunidade = Comunidade.new
    @comunidades_participadas = current_usuario.comunidades
  end

  def create_community
    @comunidade = current_usuario.comunidades_criadas.build(params_comunidade)
    @comunidade.data_criacao = Time.now
    @comunidade.usuarios << current_usuario

    if @comunidade.save
      redirect_to root_path, notice: "Comunidade criada com sucesso!"
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end

  def create_post
    @comunidades_participadas = current_usuario.comunidades
    @postagem = current_usuario.postagens.create(params_postagem)
    @postagem.data_publicacao = Time.now
    if @postagem.save
      redirect_to root_path, notice: "Postagem criada com sucesso!"
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end

  private

  def params_comunidade
    params.require(:comunidade).permit(:nome, :descricao, :avatar)
  end

  def params_postagem
    params.require(:postagem).permit(:titulo, :conteudo, :comunidade_id, imagens: [])
  end
end
