class WizardController < ApplicationController
  before_action :authenticate_user!

  include Wicked::Wizard
  include WizardHelper
  include PermitsConcern

  layout 'wizard'

  steps :license, :change_password, :step1, :step2, :step3

  def show
    current_user.update_attribute(:wizard_status, step)
    current_user.reload
    render_wizard
  end

  def update
    current_user.update(permitted_params.fetch(:user))

    if step == :change_password
      current_user.reload
      sign_in(:user, current_user, :bypass => true)
    end

    render_wizard(current_user)
  end

  def finish_wizard_path
    current_user.update_attribute(:wizard_status, :active)
    flash[:notice] =  'Well done! Your profile has been created!'
    current_user.has_passport? ? edit_user_path(current_user) : passport_assistance_path
  end

end
