class Auth::SessionsController < Devise::SessionsController

  after_action :clear_sessions_flash
  include SiteMenuHelper

  protected

    def after_sign_in_path_for(resource)
      if resource.has_passport?
        new_trip_path
      else
        flash[:info] = 'Please create a passport.'
        new_passport_path
      end
    end

    def require_no_authentication
    end

    def clear_sessions_flash
      flash.delete(:notice) if flash.keys.include?(:notice)
    end

end
