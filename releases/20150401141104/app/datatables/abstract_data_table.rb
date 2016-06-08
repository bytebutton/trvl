class AbstractDataTable
  delegate :params, :link_to, :image_tag, :can?, :l, :humanized_float, :content_tag, :pluralize, :request, :current_user, :signed_in?, :to => :@view

  def initialize(view)
    @view = view
    @records = records
    @data = data
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: @records.total_count,
      iTotalDisplayRecords: @records.total_count,
      aaData: @data
    }
  end

  private

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column(columns)
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == 'desc' ? 'desc' : 'asc'
  end

  def paginate(records)
    if records.kind_of?(Array)
      Kaminari.paginate_array(records).page(page).per(per_page)
    else
      records.page(page).per(per_page)
    end
  end

end