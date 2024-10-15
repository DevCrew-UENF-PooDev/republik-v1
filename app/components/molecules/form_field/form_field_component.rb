# frozen_string_literal: true

class Molecules::FormField::FormFieldComponent < ViewComponent::Base
  def initialize(f:, name:, label:, placeholder:, type: "text", value:, auto_complete: nil)
    @f = f
    @name = name
    @label = label
    @placeholder = placeholder
    @type = type
    @value = value
    @auto_complete = auto_complete
  end
  attr_reader :f, :name, :label, :placeholder, :type, :value, :auto_complete
end
