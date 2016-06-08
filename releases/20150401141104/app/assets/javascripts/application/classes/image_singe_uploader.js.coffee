class TravelLink.Classes.ImageSingleUploader

  constructor: (options = {}) ->
    @property    = options.mounted_as  || 'file'
    @hiddenField = options.hiddenField || ''
    @errorBlock  = options.errorBlock  || $("##{@property}-uploader-img").closest('.image-block').find('.uploaded-error')
    @configs =
      fileSelector: "##{@property}"
      imageSelector: "##{@property}-uploader-img"
      fileUploaderOptions:
        url          : "/uploads/image"
        dataType     : "json"
        start        : @start
        fail         : @fail
        done         : @done

    $.extend(@configs, options)
    $(@configs.fileSelector).fileupload(@configs.fileUploaderOptions)
    @restoreCacheImage()

  fail: (e, data) =>
    if data.errorThrown == 'Unprocessable Entity'
      @errorBlock.html('Extension white list: jpg, jpeg, gif, png')
      @restoreCacheImage()

  # File Uploader Callbacks
  done: (event, data) =>
    @errorBlock.html('')
    @insertImage(data.result)
    $("[name='#{@hiddenField}']").val(data.result.cache_name)

  start: =>
    $(@configs.imageSelector).closest('.open-fancy-box').attr('href', 'javascript: void(0)')
    $(@configs.imageSelector).attr('src', '/img/spinner.gif')

  #Class Methods
  restoreCacheImage: ->
    @insertImage(@configs.keepedFile[@configs.mounted_as])

  insertImage: (image) ->
    $(@configs.imageSelector).closest('.open-fancy-box').attr('href', image.url)
    $(@configs.imageSelector).attr('src', image.large.url)
    $(".open-fancy-box").attr('target', '_blank') if image.url.indexOf(".pdf")
