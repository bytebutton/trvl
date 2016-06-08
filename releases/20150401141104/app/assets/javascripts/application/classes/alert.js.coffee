class TravelLink.Classes.Alert extends TravelLink.Classes.BaseClass
  template: JST["templates/common/alert"]
  container: ".flash-messages"
  defaults:
    type: "success"

  @error: (options = {}) ->
    options.type = "error"
    @render(options)

  @success: (options = {}) ->
    options.type = "success"
    @render(options)

  @info: (options = {}) ->
    options.type = "info"
    @render(options)

  @destroyAll: () ->
    $(@::container).empty()

  @render: (options = {}) ->
    finalOptions = $.extend(@defaults, options)
    $(@::container).html(@::template(finalOptions))
