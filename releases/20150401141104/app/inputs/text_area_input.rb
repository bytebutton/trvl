class TextAreaInput < SimpleForm::Inputs::TextInput
  def input
    input_html_classes << 'input-block-level'
    super
  end
end
