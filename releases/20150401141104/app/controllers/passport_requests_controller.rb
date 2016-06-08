class PassportRequestsController < LoggedUserController

  def create
    create!(:notice => 'Your request for passport assistance has been sent to Pro-Link GLOBAL, someone will contact you within 24 hours to begin the process.') {
      edit_user_path(current_user)
    }
  end

  protected

    def collection
      @passport_requests = @passport_requests.page(params[:page])
    end

end
