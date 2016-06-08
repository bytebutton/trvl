module WizardHelper

  def wizard_skip_button(options = {})
    default_options = { :class => 'btn btn-large btn-block btn-success' }
    link_to('Skip', next_wizard_path, default_options.merge!(options))
  end

end
