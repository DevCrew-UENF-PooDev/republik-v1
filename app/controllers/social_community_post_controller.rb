class SocialCommunityPostController < ApplicationController
  def new
    @postagem = Postagem.new
    @comunidade = Comunidade.new
  end

  def create
    if params[:comunidade].present?
      create_community
    elsif params[:postagem].present?
      create_post
    else
      flash[:alert] = "Tipo de ação não reconhecida."
      redirect_to root_path
    end
  end

  private

  def create_community
    @comunidade = current_usuario.comunidades_criadas.build(params_comunidade)
    @comunidade.data_criacao = Time.now
    @comunidade.usuarios << current_usuario

    if @comunidade.save
      flash[:notice] = "Comunidade criada com sucesso!"
      redirect_to root_path
    else
      flash[:alert] = "Houve um problema ao criar a comunidade. Por favor, verifique os dados e tente novamente."
      render :new
    end
  end

  def create_post
    @postagem = current_usuario.postagens.create(params_postagem)
    @postagem.data_publicacao = Time.now
    if @postagem.save
      redirect_to root_path
    end
  end

  def params_comunidade
    params.require(:comunidade).permit(:nome, :descricao)
  end

  def params_postagem
    params.require(:postagem).permit(:titulo, :conteudo)
  end
end
