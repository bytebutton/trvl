class ChosenInput < SimpleForm::Inputs::CollectionSelectInput
  def input
    options[:include_blank] ||= false
    input_html_classes << 'chosen-select'
    super
  end
end
