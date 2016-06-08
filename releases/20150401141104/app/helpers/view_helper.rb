module ViewHelper

  def custom_checkbox(name, label, options = {})
    default_options = {}
    content_tag(:label, :class => 'checkbox') do
      check_box_tag(name, default_options.merge(options)) + label
    end
  end

  def half_screen(&block)
    content_tag(:div, :class => 'span5', &block)
  end

  def build_controls(label, value, options = {})
    content_tag(:div, :class => 'controls label-inline') do
      content_tag('label', label, :class => 'font-bold') + content_tag(:span , value)
    end
  end

  def upload_image(options = {})
    options[:property]      ||= 'file'

    content_tag :div, :class => 'image-block' do
      link_to(image_tag('', :id => "#{options[:property]}-uploader-img", :class => 'img-polaroid'), 'javascript:void(0)', :class => 'open-fancy-box', :target => '') +
        content_tag(:label) do
          content_tag( :span, file_field_tag( options[:property], :name => 'file' ) ) + content_tag( :p, I18n.t("buttons.upload_photo"), :class => 'btn' )
        end +
        content_tag( :span,'', :class => 'uploaded-error')
    end
  end

  def image_with_label( f, field)
    content_tag(:div, :class => 'form-group') do
      ( f.label(field) ) +
      content_tag( :div, upload_image( {:property => field } ), :class => 'col-cm-7 float-right' ) + f.input(:"#{field}_cache", :as => :hidden)
    end
  end

  def large_block_button(options = {})
    content_tag(:a, (options[:text] || ''), { :class => 'btn btn-large btn-block btn-success', :href => options[:href] || '' })
  end

  def form_header(text, options = {})
    default_options = { :class => 'form-header' }
    content_tag :legend, default_options.merge!(options) do
      content_tag(:h2, text)
    end
  end

  def required_info
    content_tag('div',:class => 'control-group') do
      content_tag('span', :class => 'font-bold text-red' ) { I18n.t('simple_form.required.mark') } + ' Indicates a required field.'
    end
  end

  def save_button(form_builder, name = 'Save', options = {})
    default_options = { :class => 'btn btn-large btn-block btn-success' }
    form_builder.button(:submit, name, default_options.merge!(options))
  end

  def cancel_button(name = 'Cancel', options = {})
    default_options = { :class => 'btn btn-large btn-block' }
    link_to(name, :back, default_options.merge!(options))
  end

  def edit_button(form_builder, option = {})
    path = option[:url] || { :controller => form_builder.class.to_s.tableize, :action => 'edit', :id => form_builder }  #TODO Change default path
    link_to( option[:name] || 'Edit', path , :class => 'btn btn-large btn-block btn-success')
  end

  def form_body(options = {}, &block)
    content_tag('fieldset', :class => options[:fieldset]) do
      legend_html = options[:legend] ? content_tag(:legend, content_tag(:h3, options[:legend])) : ''
      (legend_html + required_info + content_tag(:div, :class => 'row-fluid' || options[:class], &block)).html_safe
    end
  end

  def image(url, options = {})
    default_options = { :class => 'img-polaroid image-main', :style => 'width: 200px; height: 200px' }
    image_tag(url, default_options.merge!(options))
  end

  def fancy_box_image(image, options = {})
    link_to(image(image.url(:large), options), image.url, :class => 'open-fancy-box', :target => image.url.include?('.pdf') ? '_blank' : '')
  end

  def date_input(resource, attribute, options = {})
    default_options = {:as => '', :datepicker_class => 'add-on add-datepicker', :calendar_class => 'icon-calendar'}
    default_options.merge!(options)
    resource.input attribute,:as => default_options[:as], :wrapper => :append  do
      resource.input_field(attribute, :as => :date_picker) + content_tag('span', :class => default_options[:datepicker_class]) do
        content_tag('i','', :class => default_options[:calendar_class])
      end
    end
  end

  def active_tab?(tab)
    params[:controller] == tab ? 'active' : ''
  end

  def my_profile?(user)
    current_user.id == user.id
  end

  def boolean_translate(value)
    I18n.t(value.to_s) unless value.nil?
  end


  def table(columns, rows, options = {})
    default_options = { :class => 'table'}
    ths = ''
    content_tag(:table, default_options.merge(options)) do
      content_tag(:thead) do
        columns.map { |column| ths << content_tag(:th, column) }
        ths.html_safe
      end +
      content_tag(:tbody, rows)
    end
  end

end