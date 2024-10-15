# frozen_string_literal: true

class Atoms::CustomButton::CustomButtonComponent < ViewComponent::Base
  def initialize(name:, type: "submit")
    @name = name
    @type = type
  end

  private
  attr_reader :name, :type
end
