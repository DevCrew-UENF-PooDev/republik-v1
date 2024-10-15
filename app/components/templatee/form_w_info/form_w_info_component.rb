# frozen_string_literal: true

class Templatee::FormWInfo::FormWInfoComponent < ViewComponent::Base
  def initialize(fields:, on_submit:, submit_button_name:, form_name:, form_aditional_info:)
    @fields = fields
    @on_submit = on_submit
    @submit_button_name = submit_button_name
    @form_name = form_name
    @form_aditional_info = form_aditional_info
  end

  private

  attr_reader :fields, :on_submit, :submit_button_name, :form_name, :form_aditional_info
end
