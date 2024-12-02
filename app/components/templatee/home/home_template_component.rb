class Templatee::Home::HomeTemplateComponent < ViewComponent::Base
  def initialize(posts:, communities:, comunidades_participadas:)
    @posts = posts
    @communities = communities
    @comunidades_participadas = comunidades_participadas
  end

  def comunidade_info(comunidade)
    "#{comunidade.nome} - Última atividade há #{time_ago_in_words(comunidade.updated_at)} atrás"
  end

  def posts
    @posts
  end

  private

  attr_reader :posts, :communities, :comunidades_participadas
end
