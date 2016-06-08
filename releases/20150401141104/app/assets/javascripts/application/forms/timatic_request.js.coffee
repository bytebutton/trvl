window.TravelLink.Forms.TimaticRequest =
  accordion: ->
    $visa_info_button       = $('#show_visa_info')
    $passport_info_button   = $('#show_passport_info')

    $visa_info_block        = $('#visa_info')
    $passport_info_block    = $('#passport_info')

    $visa_info_button.on 'click', () ->
      if $visa_info_block.hasClass('hidden')
        $visa_info_button.html('[-] Visa Assistance')
        $visa_info_block.removeClass('hidden')
      else
        $visa_info_button.html('[+] Visa Assistance')
        $visa_info_block.addClass('hidden')

    $passport_info_button.on 'click', () ->
      if $passport_info_block.hasClass('hidden')
        $passport_info_button.html('[-] Passport Requirements')
        $passport_info_block.removeClass('hidden')
      else
        $passport_info_button.html('[+] Passport Requirements')
        $passport_info_block.addClass('hidden')
