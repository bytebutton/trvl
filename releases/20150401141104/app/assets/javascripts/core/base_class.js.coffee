class TravelLink.Classes.BaseClass

  constructor: ->
    $(document).one 'page:fetch', @onPageExit

  onPageExit: =>
    console.log "onPageExit fired"
