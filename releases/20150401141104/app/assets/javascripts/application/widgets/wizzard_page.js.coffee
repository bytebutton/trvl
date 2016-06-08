window.TravelLink.Widgets.WizardLicense =
  toggelButton: ->
    $('#user_is_agreed_terms').on 'change', (event) ->
      $('input.btn-success').prop('disabled', !$(event.currentTarget).is(':checked'))
    .trigger('change')