class DatePickerInput < SimpleForm::Inputs::StringInput

  def input
    value = input_html_options[:value]
    value ||= object.send(attribute_name) if object.respond_to?(attribute_name)

    value = Time.parse(value) if value.kind_of?(String)
    value = Time.now unless value

    input_html_options[:value] ||= value.strftime('%d %B %Y')

    input_html_classes << 'datepicker'
    super
  end
end
