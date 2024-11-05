class Atoms::UserAvatar::UserAvatarComponent < ViewComponent::Base
  def initialize(avatar_url:, size: "small")
    @avatar_url = avatar_url
    @size = size
  end

  private

  attr_reader :avatar_url, :size
end