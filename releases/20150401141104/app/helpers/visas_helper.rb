module VisasHelper

  def visa_status_text(visa)
    visa.certified? ? 'Certified' : 'Not Certified'
  end

end
