class HomeController < ApplicationController
  before_action :usuario_signed_in?
  def index
  end
end