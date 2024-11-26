# frozen_string_literal: true

class Molecules::FormField::FormFieldComponent < ViewComponent::Base
  def initialize(f:, name:, label:, value:,
    is_field_invalid:, errors_messages:, type: "text", options: [], **rest)
    @f = f
    @name = name
    @label = label
    @type = type
    @value = value
    @is_field_invalid = is_field_invalid
    @errors_messages = errors_messages
    @options = options
    @rest = rest
  end
  private
  attr_reader :f, :name, :label, :type, :value, :is_field_invalid, :errors_messages, :rest, :options
end
