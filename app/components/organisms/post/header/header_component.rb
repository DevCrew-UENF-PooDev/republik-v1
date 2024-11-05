class Organisms::Post::Header::HeaderComponent < ViewComponent::Base
  def initialize(group_name:, time_posted:, user_avatar:)
    @group_name = group_name
    @time_posted = time_posted
    @user_avatar = user_avatar
  end

  private

  attr_reader :group_name, :time_posted, :user_avatar
end