class Templatee::Home::HomeTemplateComponent < ViewComponent::Base
  def initialize(posts:, communities:, comunidades_participadas:)
    @posts = posts
    @communities = communities
    @comunidades_participadas = comunidades_participadas
  end

  private

  attr_reader :posts, :communities, :comunidades_participadas
end
