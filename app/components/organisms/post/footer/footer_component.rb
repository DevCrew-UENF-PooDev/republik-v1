class Organisms::Post::Footer::FooterComponent < ViewComponent::Base
  def initialize(likes_count:, comments_count:, shares_count: 0)
    @likes_count = likes_count
    @comments_count = comments_count
    @shares_count = shares_count
  end
  private

  attr_reader :likes_count, :comments_count, :shares_count
end