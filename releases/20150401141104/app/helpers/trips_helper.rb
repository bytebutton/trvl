module TripsHelper

  def dates_range(trip)
    [I18n.l(trip.date_from), '-', I18n.l(trip.date_to)].join(' ')
  end

  def arrival_destination_places(trip)
    "#{trip.from.name} - #{trip.to.name}"
  end

  def visa_status(trip)
    trip.visa_required? ? 'Yes' : 'No'
  end

  def timatic_block(name)
    render({:partial => 'trips/partials/timatic_block', :locals => {:timatic_block => name}})
  end

  def print_section(label, property)
    if property
      content_tag(:p) do
        content_tag(:strong, "#{label}: #{property}")
      end
    end
  end

  def scenarios_message(trip)
    visa_status   = false
    possible_visa = trip.visa

    visa_status   = possible_visa.certified? if possible_visa

    passport_criteria = trip.passport_required? && ((current_user.passport.andand.expires_on < (trip.date_to + 6.months)) || trip.passport_request.doesnt_have_blank_pages? || trip.passport_request.damaged?)

    case [trip.visa_required?, possible_visa.present?, passport_criteria]
      when [true, true, false]
        if(visa_status)
          {
              :required => "Visa Required (visa certified by #{SITE_BRAND}).",
              :message => "<b>VISA REQUIRED.</b> You have valid visa for a trip to #{trip.to.name}.",
              :visa_assistance_message => "A visa is required for this trip. We see that you have uploaded a visa. Click submit at the bottom of the page to create your trip and send your visa to #{SITE_BRAND} for review. We will review and confirm via email if your visa is valid and you can use it to travel.",
              :status => :notice
          }
        else
          {
              :required => 'Visa Required (visa pending review).',
              :message  => "<b>VISA REQUIRED.</b> #{SITE_BRAND} will review the uploaded visa and will contact you via email within 24 hours to confirm that your visa is valid and that you can use it travel to #{@trip.to.name}.",
              :visa_assistance_message => "A visa is required for this trip. We see that you have uploaded a visa. Click submit at the bottom of the page to create your trip and send your visa to #{SITE_BRAND} for review. We will review and confirm via email if your visa is valid and you can use it to travel.",
              :status => :info
          }
        end
      when [true, true, true]
        if (visa_status)
          {
              :required => "Visa Required (visa certified by #{SITE_BRAND}) and Passport Assistance Needed.",
              :message  => "<b>VISA REQUIRED.</b> You have valid visa for a trip to #{trip.to.name}.",
              :visa_assistance_message => "A visa is required for this trip. We see that you have uploaded a visa. Click submit at the bottom of the page to create your trip and send your visa to #{SITE_BRAND} for review. We will review and confirm via email if your visa is valid and you can use it to travel.",
              :status => :notice
          }
        else
          {
              :required => 'Visa Required (visa pending review) and Passport Assistance Needed.',
              :message  => "<b>VISA REQUIRED.</b> #{SITE_BRAND} has received your request for passport assistance and will review the uploaded visa. We will contact you via email within 24 hours to confirm the next steps.",
              :visa_assistance_message => "A visa is required for this trip. We see that you have uploaded a visa. Click submit at the bottom of the page to create your trip and send your visa to #{SITE_BRAND} for review. We will review and confirm via email if your visa is valid and you can use it to travel.",
              :status => :info
          }
        end
      when [true, false, false]
        {
            :required => 'Visa Required.',
            :message  => "<b>VISA REQUIRED.</b> #{SITE_BRAND} has received your request for visa assistance. We will contact you via email within 24 hours to confirm the next steps.",
            :visa_assistance_message => "A visa is required for this trip. Click submit at the bottom of the page to create your trip and send your visa assistance request to #{SITE_BRAND}.",
            :status => :error
        }
      when [true, false, true]
        {
            :required => 'Visa Required and Passport Assistance Needed.',
            :message  => "<b>VISA REQUIRED.</b> #{SITE_BRAND} has received your request for visa and passport assistance. We will contact you via email within 24 hours to confirm the next steps.",
            :visa_assistance_message => "A visa is required for this trip. Click submit at the bottom of the page to create your trip and send your visa assistance request to #{SITE_BRAND}.",
            :status => :error
        }
      when [false, false, true]
        {
            :required => 'Visa Not Required and Passport Assistance Needed.',
            :message => "<b>VISA NOT REQUIRED.</b> #{SITE_BRAND} has received your request for passport assistance. We will contact you via email within 24 hours to confirm the next steps.",
            :visa_assistance_message => 'A visa is not required for this trip. Click submit at the bottom of the page to create your trip.',
            :status => :notice
        }
      else
        {
            :required => 'Visa Not Required',
            :message  => '<b>VISA NOT REQUIRED.</b> Do you want to create another trip?',
            :visa_assistance_message => 'A visa is not required for this trip. Click submit at the bottom of the page to create your trip.',
            :status => :notice
        }
    end
  end

  def print_visa_status(trip)
    html = ''
    if trip.home_country?
      html << "<strong class=\"text-success\">All OK. You hold a passport to this country.</strong>"
    elsif trip.visa.present?
      if trip.visa.certified?
        html << "<strong class=\"text-success\">You have an existing visa that you can use on this trip.(Certified by #{SITE_BRAND})</strong>"
      else
        html << "<strong class=\"text-warning\">You have an existing visa that you can use on this trip.(Not yet certified by #{SITE_BRAND})</strong>"
      end
    elsif !trip.visa_required?
      html << "<strong class=\"text-success\">No, visa not required</strong>"
    elsif trip.visa_required?
      html << "<strong class=\"text-error\">Yes, visa is required</strong>"
    end
    html.html_safe
  end

  def add_visa_for_trip
    if current_user.admin?
      "<p><a href=\"#{rails_admin.new_path('visa')}\" class=\"btn btn-mini\" >Add Visa Now (Admin Panel)</a></p>".html_safe
    else
      "<p><a href=\"#{new_visa_path}\" class=\"btn btn-mini\" >Add Visa Now </a></p>".html_safe
    end
  end

  ########################################## Timatic Parse #############################################################

  def timatic_parse(response)
    passport_required = false
    visa_required = false
    subsection_information = { :passport => [], :visa => [] }

    puts response.inspect

    response[:section_information].each do |section|
      section_name = section[:section_name].downcase.to_sym
      # pasport and visa statuses

      passport_required = paragraph_text(section[:document_paragraph]) == 'Passport required.' if section_name == :passport
      visa_required = paragraph_text(section[:document_paragraph]) == 'Visa required.' if section_name == :visa

      #additional information
      section[:subsection_information] = Array.new([section[:subsection_information]]) if section[:subsection_information].kind_of?(Hash)
      section[:subsection_information].each do |subsection|
        subsection_information[section_name] << {
            :label => subsection[:subsection_name],
            :information => get_paragraph(subsection[:document_paragraph])
        }
      end
    end

    { :passport_required => passport_required, :visa_required => visa_required, :subsection_information => subsection_information }
  end

  def paragraph_text(paragraph)
    if paragraph
      paragraph[:paragraph_text].kind_of?(Hash) ? paragraph[:paragraph_text][:p] : paragraph[:paragraph_text]
    end
  end

  def get_paragraph(document_paragraph)
    information = []
    document_paragraph = Array.new([document_paragraph]) if document_paragraph.kind_of?(Hash)
    document_paragraph.each {|p| information << { :text => paragraph_text(p), :type => p[:paragraph_type].downcase } }
    information
  end

  ########################################## Timatic Parse #############################################################

end
