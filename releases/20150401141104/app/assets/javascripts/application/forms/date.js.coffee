window.TravelLink.Forms.Date =
  changeDateRange:(options = {}) ->
    $startDate = $("\##{options['startDate']}")
    $endDate   = $("\##{options['endDate']}")

    $startDate.on 'change', (event) ->
      $endDate.val($startDate.val()) if new Date($startDate.val()) > new Date($endDate.val())
      options['startDateChange']?(event)

    $endDate.on 'change', ->
      $startDate.val($endDate.val()) if new Date($startDate.val()) > new Date($endDate.val())
      options['endDateChange']?(event)