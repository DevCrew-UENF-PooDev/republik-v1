class HomeController < ApplicationController
  before_action :usuario_signed_in?
  def index
    @postagens = Postagem.all
  end
end
