class LoggedUserController < InheritedResources::Base

  before_action :authenticate_user!, :check_of_new_user

  load_and_authorize_resource

  include PermitsConcern

  def check_of_new_user
    unless current_user.active?
      flash[:info] = 'First you should setup your profile.'
      redirect_to wizard_path(current_user.wizard_status)
    end
  end

end
