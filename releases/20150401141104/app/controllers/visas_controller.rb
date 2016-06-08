class VisasController < LoggedUserController

  custom_actions :collection => :my

  protected

    def collection
      @visas = @visas.page(params[:page])
    end

end
