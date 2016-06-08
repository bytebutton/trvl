class TravelLink.Classes.LandingPage extends TravelLink.Classes.BaseClass
  constructor: ->
    @$menu_cell = $('.menu_cell')
    @$inputs    = $('#user_email, #user_password')
    @bindEvents()
    @changeButtonHeight()
    @changeImagesSizes()
    @menuResizer()

  bindEvents: ->
    unless $('#menu_nav').length
      $('.brand').css({'font-size': '30pt', 'padding-top' : '30px'})

    $(window).resize =>
      @changeButtonHeight()
      @changeImagesSizes()
    .trigger('resize')

  changeButtonHeight: ->
    @$menu_cell.height(@$menu_cell.width())

  changeImagesSizes: ->
    if $(window).width() < 500
      @$inputs.removeClass("span3").addClass("input-block-level")
      $('#textBr').removeClass('hidden')
    else
      @$inputs.removeClass("input-block-level").addClass("span3")
      $('#textBr').addClass('hidden')


  menuResizer: ->
    $menu_table = $(".table-menu")

    $(".activePopover, [data-toggle='popover']").popover()

    $(window).resize ->
      $node_td = $menu_table.find('td')
      $node_td.height($node_td.width())
    .trigger("resize")

    $menu_table.find('a').on 'click', (event) ->
      $('.active').find('a').not($(event.target)).popover('hide')
      $closest_td_node = $(event.target).closest('td')
      $menu_table.find('td').not($closest_td_node).removeClass('active')
      $closest_td_node.toggleClass('active')