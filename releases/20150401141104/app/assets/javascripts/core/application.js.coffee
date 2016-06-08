window.TravelLink ||= {}
window.TravelLink.Classes ||= {}
window.TravelLink.Forms ||= {}
window.TravelLink.Modals ||= {}
window.TravelLink.Widgets ||= {}
class TravelLink.Application
  spinner: JST['templates/common/spinner']
  currentUser: window.currentUser

  constructor: ->
    window.ClientSideValidations.selectors =
      inputs: ':input:not(button):not([type="submit"])[name]:visible:enabled, :input.chosen-select:not(button):not([type="submit"])[name]:enabled',
      validate_inputs: ':input:enabled:visible[data-validate], :input.chosen-select:enabled[data-validate]',
      forms: 'form[data-validate]'

    $.extend true, $.fn.dataTable.defaults,
#      sPaginationType: "bootstrap"
#      oLanguage:
#        sLengthMenu: "_MENU_  Records per page"
      "pageLength"    : 50
      "processing"    : true
      "serverSide"    : true
#      bRetrieve      : true
#      bAutoWidth     : false
#      bSort          : false
      'dom'           : 'T<"clear">lrtip'

  start: ->
    $(document).on 'ready', @afterRenderPage
    $(document).on 'ready page:load', @afterTurbolinkRenderPage

  afterRenderPage: =>
    @initializeNProgress()
    @askAboutCurrentTrip()

  afterTurbolinkRenderPage: =>
    $(".chosen-select").chosen
      "allow_single_deselect"     : true
      "disable_search_threshold"  : 5
      "width"                     : "80%"
#      "width"                     : "100%"

    new TravelLink.Classes.UsaStates

    $galleryHolder = $('<div id="gallery_holder"></div>').appendTo(document.body) # fix for turbolinks

    $('.open-fancy-box').fancybox
      'parent'     : $galleryHolder
      'autoCenter' : true
      'closeClick' : true
      'closeBtn'   : false

    $(".datepicker").datepicker
      'changeMonth': true
      'changeYear': true
      'yearRange': "1900:2080"
      'dateFormat': "d MM yy"
      'duration': "fast"

    @paginate()

    $(".add-on").filter(".add-datepicker").on "click", (event) ->
      event.preventDefault()
      $(event.currentTarget).closest('.input-append').find('.datepicker').datepicker( "show" )

    @validateFroms()
    $('.modal').on("shown", @validateFroms)

    $("a[rel~=popover], .has-popover").popover()
    $("a[rel~=tooltip], .has-tooltip").tooltip()

  initializeNProgress: ->
    NProgress.configure({showSpinner: false})
    $(document).on 'page:fetch',   NProgress.start
    $(document).on 'page:change',  NProgress.done
    $(document).on 'page:restore', NProgress.remove

  paginate: ->
    if $('.pagination').length
      if $('.table').length
        TravelLink.Widgets.Paginate.init({ selector :'table tbody', itemSelector : 'table tbody tr'})
      else
        TravelLink.Widgets.Paginate.init({ selector :'#page', itemSelector : '.item'})

  validateFroms: ->
    $('form[data-validate="true"]').disableClientSideValidations().enableClientSideValidations()

  askAboutCurrentTrip: ->
    $current_trip = $('#current-trip')
    $current_trip.modal('show') if $current_trip.length


