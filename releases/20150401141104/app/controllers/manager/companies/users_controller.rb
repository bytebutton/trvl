class Manager::Companies::UsersController < LoggedUserController
  load_and_authorize_resource :user, :through => :company

  belongs_to :company

  # GET /manager/companies/users.json
  def index
    respond_with(@users) do |format|
      format.json { render( {:json => UsersDataTable.new(view_context)} ) }
    end
  end

  # PATCH/PUT /manager/companies/users/1.json
  def update
    super do |success, failure|
      success.html { redirect_to edit_manager_company_user_path(params[:company_id], @user) }
      failure.html { render(:action => 'edit')}

      success.json { render(:action => 'show', :status => :ok, :location => @user) }
      failure.json { render(:json => @user.errors, :status => :unprocessable_entity) }
    end
  end

end
