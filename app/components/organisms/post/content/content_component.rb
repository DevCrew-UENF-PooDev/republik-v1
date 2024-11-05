class Organisms::Post::Content::ContentComponent < ViewComponent::Base
  def initialize(image_url:, description:, tags: [])
    @image_url = image_url
    @description = description
    @tags = tags
  end

  private

  attr_reader :image_url, :description, :tags
end