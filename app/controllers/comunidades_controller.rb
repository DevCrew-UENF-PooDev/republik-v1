class ComunidadesController < ApplicationController
  def new
    @comunidade = Comunidade.new
  end

  def create
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
  

  private

  def params_comunidade
    params.require(:comunidade).permit(:nome, :descricao)
  end
end