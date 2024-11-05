class Organisms::CommunitySidebar::CommunitySidebarComponent < ViewComponent::Base
  def initialize(communities:)
    @communities = communities
  end

  private

  attr_reader :communities
end