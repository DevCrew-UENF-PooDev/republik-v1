class Organisms::FeedComponent::FeedComponent < ViewComponent::Base
  def initialize(posts:)
    @posts = posts
  end

  private

  attr_reader :posts
end