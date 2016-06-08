window.TravelLink.Forms.Trip =
  init: (@options = {}) ->
    @$trip_date_to   = $('#trip_date_to')
    @$trip_date_from = $('#trip_date_from')
    @$trip_purpose   = $('#trip_purpose_id')
    @$trip_country   = $('#trip_to_id')
    @$purpose_modal  = $('#purpose-details')
    @$visaStatus     = $('.visa-status')

    @$visaHandlers    = $('#trip_date_to, #trip_date_from, #trip_purpose_id, #trip_to_id')

    @initModalWindowsScenarious()

    @$trip_purpose.on 'change', (event) =>
      $current_option = $(event.currentTarget).find("option:selected")
      @$purpose_modal.find(".modal-header > h3").html($current_option.data("original-title"))
      @$purpose_modal.find(".modal-body").html($current_option.data("content"))
      @$purpose_modal.modal("show")

    TravelLink.Forms.Date.changeDateRange
      'startDate'       : 'trip_date_from'
      'startDateChange' : =>
        @checkAvailableDates (text) =>
          @paintOnStatusAccessibility(text)
      'endDate'         : 'trip_date_to'
      'endDateChange'   : =>
        @checkAvailableDates (text) =>
          @paintOnStatusAccessibility(text)

    @$visaHandlers.on 'change', =>
      @checkAvailableVisas (cb) =>
        unless cb.visa
          @$visaStatus.html("<p class='text-red'>Does not have a suitable visa for this trip<p>")
        else if cb.is_valid_entries
          @$visaStatus.html("<p class='text-green'>Visa is avaible for this trip: #{cb.visa.number}<br> Current visa valid period: #{cb.visa.valid_from} - #{cb.visa.expires_on} </p>")
        else
          @$visaStatus.html("<p class='text-orange'> You have visa (#{ cb.visa.number }) for this trip but you are not allowed to use it due to entries restrictions</p>")

    @initTransitDates()

  checkAvailableDates: (cb) ->
    $.get "/api/v1/trips/available_dates",
      date_from : @$trip_date_from.val(),
      date_to   : @$trip_date_to.val(),
      trip_id   : @options.id
    , cb

  checkAvailableVisas: (cb) ->
    $.get "/api/v1/visas/available_visas",
      valid_from : @$trip_date_from.val(),
      expires_on : @$trip_date_to.val(),
      purpose_id : @$trip_purpose.find("option:selected").val()
      country_id : @$trip_country.find("option:selected").val()
    , cb

  postNewVisa: ->
    $visaForm = $('#add-visa').find('form')
    $.ajax
      'url'      : $visaForm.attr('action')
      'dataType' : 'script'
      'type'     : 'POST'
      'data'     : $visaForm.serialize()

  paintOnStatusAccessibility: (text = false) ->
    TravelLink.Classes.Alert.destroyAll()
    if text != 'false'
      TravelLink.Classes.Alert.error({text})
      @$trip_date_from.closest(".control-group").removeClass("success").addClass("error")
      @$trip_date_to.closest(".control-group").removeClass("success").addClass("error")
    else
      @$trip_date_from.closest(".control-group").removeClass("error").addClass("success")
      @$trip_date_to.closest(".control-group").removeClass("error").addClass("success")

  initModalWindowsScenarious: ->
    $tripForm          = $('#new_trip')
    $visaQuestion      = $('#visa-question')
    $visaQuestionNo    = $visaQuestion.find('.modal-no')
    $visaQuestionYes   = $visaQuestion.find('.modal-yes')
    $checkVisa         = $('#check-visa')
    $checkVisaNo       = $checkVisa.find('.modal-no')
    $checkVisaYes      = $checkVisa.find('.modal-yes')
    $addVisa           = $('#add-visa')
    $addVisa.find('input.btn.btn-large.btn-block.btn-success, a.btn.btn-large.btn-block').remove()
    $addVisaNo         = $addVisa.find('.modal-no')
    $addVisaYes        = $addVisa.find('.modal-yes')
    showModal          = true

    $visaQuestionYes.removeAttr('onclick')
    $checkVisaYes.removeAttr('onclick')
    $addVisaYes.removeAttr('onclick')

    $visaQuestionNo.off('click').on 'click', ->
      $visaQuestion.modal('hide')
      $checkVisa.modal('show')

    $visaQuestionYes.off('click').on 'click', ->
      $visaQuestion.modal('hide')
      $addVisa.modal('show')

    $addVisaNo.off('click').on 'click', ->
      $addVisa.modal('hide')
      $visaQuestion.modal('show')

    $addVisa.find('form').on 'submit', (event) =>
      event.preventDefault()
      setTimeout (=>
        @postNewVisa() if $(event.currentTarget).isValid(ClientSideValidations.validators)
      ), 100

    $addVisaYes.off('click').on 'click', =>
      $addVisa.find('form').submit()

    $checkVisaNo.off('click').on 'click', ->
      $('#trip_with_api_request').val(false)
      $checkVisa.modal('hide')
      showModal = false
      $tripForm.submit()

    $checkVisaYes.off('click').on 'click', ->
      $('#trip_with_api_request').val(true)
      $checkVisa.modal('hide')
      showModal = false
      $tripForm.submit()

    $tripForm.on 'submit', (event) =>
      if showModal
        event.preventDefault()
        event.stopPropagation()
        @checkAvailableDates (text) =>
          @paintOnStatusAccessibility(text)
          if text == 'false' && $tripForm.isValid(ClientSideValidations.validators)
            $visaQuestion.modal('show')

  initTransitDates: ->
    transit_input = $("#trip_transit_country_id")

    if transit_input.find('option:selected').val()
      @showTransitDatesInputs()
      transit_input.off('change')

    transit_input.change (event) =>
      @showTransitDatesInputs()
      $(event.currentTarget).off('change')

  showTransitDatesInputs: ->
    arrival_input = $(".trip_transit_arrival_date")
    departure_input = $(".trip_transit_departure_date")

    arrival_input.find("label").removeClass('hidden')
    departure_input.find("label").removeClass('hidden')

    arrival_input.removeClass('hidden')
    departure_input.removeClass('hidden')