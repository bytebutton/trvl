module PassportRequestsHelper

  def request_status
    content_tag(:span, 'Passport Request: Not yet processed', {:class => 'label label-warning'}) if current_user.has_passport_request?
  end

  def processed_status(passport_request)
    if passport_request.is_processed
      content_tag(:span, 'In process', {:class => 'label label-warning'})
    else
      content_tag(:span, 'Processed', {:class => 'label label-success'})
    end
  end

end