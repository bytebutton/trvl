class Api::V1::VisasController < LoggedUserController

  def available_visas
    available_visa = current_user.visas.available_visas(params[:country_id], params[:purpose_id], params[:valid_from], params[:expires_on]).first
    is_valid_entries = available_visa.andand.free_entries.present?
    render :json => { :visa => available_visa, :is_valid_entries => is_valid_entries }
  end

end
