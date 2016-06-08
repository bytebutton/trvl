module ModalHelper

  #modals have a header, a body, a footer for options.
  def modal_dialog(options = {}, &block)
    content_tag :div, :id => options[:id], :class => 'bootstrap-modal modal hide fade' do
      modal_header(options[:header]) +
      modal_body(options[:body]) +
      modal_footer(options[:footer])
    end
  end

  def modal_header(options = {}, &block)
    content_tag :div, :class => 'modal-header' do
      if options[:show_close]
        close_button(options[:dismiss]) + content_tag(:h3, options[:title], &block)
      else
        content_tag(:h3, options[:title], &block)
      end
    end
  end

  def modal_body(options = {}, &block)
    content_tag :div, options, :class => 'modal-body', &block
  end

  def modal_footer(options = {}, &block)
    content_tag :div, options, :class => 'modal-footer', &block
  end

  def close_button(dismiss)
    #It doesn't seem to like content_tag, so we do this instead.	
    raw("<button class=\"close\" data-dismiss=\"#{dismiss}\">&times;</button>")
  end

  def modal_toggle(content_or_options = nil, options = {}, &block)
    if block_given?
      options = content_or_options if content_or_options.is_a?(Hash)
      default_options = { :class => 'btn', 'data-toggle' => 'modal', 'href' => options[:dialog] }.merge(options)
      content_tag :a, nil, default_options, true, &block
    else
      default_options = { :class => 'btn', 'data-toggle' => 'modal', 'href' => options[:dialog] }.merge(options)
      content_tag :a, content_or_options, default_options, true
    end
  end

  def modal_cancel_button(content, options = {})
    default_options = { :class => 'btn bootstrap-modal-cancel-button' }
    content_tag_string('a', content, default_options.merge!(options))
  end


  def yes_button(text)
    content_tag(:button, text, :class => 'btn btn-danger modal-yes', :onclick => 'javascript:$(this).closest("div.modal").find("form").submit()')
  end

  def no_button(text)
    content_tag(:button, text,  :class => 'btn modal-no', :data => {:dismiss => 'modal'})
  end

  def build_buttons(options = {})
    no_button(options[:no] || 'No') + yes_button(options[:yes] || 'Yes')
  end

  def prompt_buttons
    build_buttons
  end

  def form_buttons
    build_buttons({:no => 'Close', :yes => 'Save'})
  end


end

