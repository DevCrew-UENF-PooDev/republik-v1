# frozen_string_literal: true

class Molecules::FormField::FormFieldComponent < ViewComponent::Base
  def initialize(f:, name:, label:, placeholder:, value:,
    is_field_invalid:, errors_messages:, type: "text", auto_complete: nil)
    @f = f
    @name = name
    @label = label
    @placeholder = placeholder
    @type = type
    @value = value
    @auto_complete = auto_complete
    @is_field_invalid = is_field_invalid
    @errors_messages = errors_messages
  end
  private
  attr_reader :f, :name, :label, :placeholder, :type, :value, :auto_complete, :is_field_invalid, :errors_messages
end
