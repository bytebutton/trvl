class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :with => :exception

  include ApplicationHelper
  include AuthHelper
  include ModalHelper
  include SiteMenuHelper

  respond_to :html, :json, :js

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to(root_path, :alert => exception.message)
  end

  before_action :keep_user, :if => :user_signed_in?

  private

    def keep_user
      User.current_user = current_user
    end

end
