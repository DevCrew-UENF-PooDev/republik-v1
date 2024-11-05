class Templatee::Home::HomeTemplateComponent < ViewComponent::Base
  def initialize(posts:, communities:)
    @posts = posts
    @communities = communities
  end

  private

  attr_reader :posts, :communities
end
