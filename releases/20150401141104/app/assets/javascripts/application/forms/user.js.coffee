window.TravelLink.Forms.User =
  init: (options = {}) ->
    $('#user_profile_attributes_has_more_nationality').off('change').on('change', @checkNationalities).trigger('change')

  checkNationalities: (event) ->
    $nationalities = $('div.user_profile_second_nationality, div.user_profile_third_nationality')
    if $(event.currentTarget).is(':checked') then $nationalities.show() else $nationalities.hide()

