class ContactController < LoggedUserController
  skip_load_and_authorize_resource

  before_action :load_resources, :only => :index

  def index
  end

  private

    def load_resources
      @secure_message   = SecureMessage.new
      @request_callback = RequestCallback.new
    end

end
