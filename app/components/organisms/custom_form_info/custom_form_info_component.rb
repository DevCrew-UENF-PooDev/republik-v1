# frozen_string_literal: true

class Organisms::CustomFormInfo::CustomFormInfoComponent < ViewComponent::Base
  def initialize(aditional_info:)
    @aditional_info = aditional_info
  end

  private

  attr_reader :aditional_info
end
