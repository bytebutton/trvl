class PassportsController < LoggedUserController

  before_action :load_passport_request, :except => [:index, :show]

  custom_actions :collection => [:my, :assistance]

  protected

    def collection
      @passports = @passports.page(params[:page])
    end

  private

    def load_passport_request
      @passport_request = PassportRequest.new
    end

end
