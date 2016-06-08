class UsersDataTable < AbstractDataTable
  delegate :edit_manager_company_user_path, :to => :@view

  private
    def data
      records.map do |user|
        [
            user.companies_list,
            user.full_name,
            user.id,
            user.email,
            "#{link_to('Edit', edit_manager_company_user_path(params[:company_id], user.id), :class => 'btn')}"
        ]
      end
    end

    def records
      paginate(@view.assigns['users'])
    end

end