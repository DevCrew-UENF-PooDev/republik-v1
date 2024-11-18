class MembrosController < ApplicationController
  before_action :authenticate_usuario!

  def create
    @comunidade = Comunidade.find(params[:comunidade_id])
    @membro = @comunidade.membros.build(usuario: current_usuario)

    if @membro.save
      flash[:notice] = "Você agora faz parte da comunidade #{@comunidade.nome}!"
    else
      flash[:alert] = "Não foi possível participar da comunidade."
    end
    redirect_to root_path
  end
end
