class ComunidadesController < ApplicationController
  def index
    @comunidades = Comunidade.where("nome LIKE ?", "%#{params[:query]}%") if params[:query].present?
    @comunidades ||= Comunidade.all

    respond_to do |format|
      format.html # Renderiza a página completa
      format.turbo_stream # Renderiza apenas o Turbo Frame
    end
  end

  def join
    @comunidade = Comunidade.find(params[:id])

    if current_usuario.comunidades.include?(@comunidade)
      current_usuario.comunidades.delete(@comunidade)
      @action = :leave
    else
      current_usuario.comunidades << @comunidade
      @action = :join
    end

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.turbo_stream
    end
  end

  # def join
  #   @comunidade = Comunidade.find(params[:id])

  #   if current_usuario.comunidades.include?(@comunidade)
  #     current_usuario.comunidades.delete(@comunidade)
  #     @action = :leave
  #   else
  #     current_usuario.comunidades << @comunidade
  #     @action = :join
  #   end

  #   respond_to do |format|
  #     format.html { redirect_to root_path, notice: "Sua participação foi atualizada." }
  #     format.turbo_stream
  #   end
  # end


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

  def show
    @comunidade = Comunidade.find(params[:id])
    @posts = @comunidade.posts
  end

  private

  def params_comunidade
    params.require(:comunidade).permit(:nome, :descricao)
  end
end
