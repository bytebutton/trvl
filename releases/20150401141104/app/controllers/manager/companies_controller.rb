class Manager::CompaniesController < LoggedUserController

  protected

    def collection
      @companies = @companies.page(params[:page])
    end

end
