# frozen_string_literal: true

class Organisms::CustomForm::CustomFormComponent < ViewComponent::Base
  def initialize(fields:, on_submit:, form_name:, submit_button_name:, form_aditional_info:, resource:)
    @fields = fields
    @on_submit = on_submit
    @form_name = form_name
    @submit_button_name = submit_button_name
    @form_aditional_info = form_aditional_info
    @resource = resource
  end
  private
  attr_reader :fields, :on_submit, :form_name, :submit_button_name, :form_aditional_info, :resource
end
