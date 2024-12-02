class Organisms::Post::PostComponent < ViewComponent::Base
  def initialize(post:)
    @post = post
  end

  private

  attr_reader :post
end
