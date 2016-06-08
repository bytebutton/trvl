class Manager::Companies::VisasController < LoggedUserController
  load_and_authorize_resource :visa, :through => :company

  belongs_to :company

  # GET /manager/companies/users.json
  def index
    respond_with(@visas) do |format|
      format.json { render( {:json => VisasDataTable.new(view_context)} ) }
    end
  end

end
