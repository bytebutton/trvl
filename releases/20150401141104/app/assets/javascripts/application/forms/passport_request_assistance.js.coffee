window.TravelLink.Forms.PassportRequestAssistance =
  init: (@options = {}) ->
    $needPassportCheckBox = $('#passport_request_is_assistance')
    $alertMessageBlock    = $('#alert-message')
    $passportRequestForm  = $('#new_passport_request')

    $needPassportCheckBox.on 'change', (event)->
      $alertMessageBlock.html('') if $needPassportCheckBox.prop('checked')

    $passportRequestForm.find('input[type="submit"]').on 'click', (event) ->
      unless $needPassportCheckBox.prop('checked')
        event.preventDefault()
        $alertMessageBlock.html('<span class="text-red">Please make a selection to proceed</span>')