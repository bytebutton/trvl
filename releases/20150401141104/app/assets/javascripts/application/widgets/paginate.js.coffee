window.TravelLink.Widgets.Paginate =
  init:(options ={}) ->
    default_options =
      navSelector  : "nav.pagination"
      nextSelector : "nav.pagination a[rel=next]"
      itemSelector : ".item"
      loading :
        img : "/assets/loading.gif"
        msgText : ''
        finishedMsg: ''
      bufferPx: 200
      debug : false

    $(options.selector).infinitescroll($.extend(default_options, options))