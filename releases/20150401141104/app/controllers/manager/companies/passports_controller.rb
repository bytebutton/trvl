class Manager::Companies::PassportsController < LoggedUserController
  load_and_authorize_resource :passport, :through => :company

  belongs_to :company

  # GET /manager/companies/users.json
  def index
    respond_with(@passports) do |format|
      format.json { render( {:json => PassportsDataTable.new(view_context)} ) }
    end
  end

end
