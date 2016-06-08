#
#  Client Side Validations - SimpleForm - v2.1.0
#  https://github.com/dockyard/client_side_validations-simple_form
#
#  Copyright (c) 2013 DockYard, LLC
#  Licensed under the MIT license
#  http://www.opensource.org/licenses/mit-license.php
#
(->
  ClientSideValidations.formBuilders["SimpleForm::FormBuilder"] =
    add: (element, settings, message) ->
      @wrappers[settings.wrapper].add.call this, element, settings, message

    remove: (element, settings) ->
      @wrappers[settings.wrapper].remove.call this, element, settings

    wrappers:
      default:
        add: (element, settings, message) ->
          errorElement = undefined
          wrapper = undefined
          errorElement = element.parent().find("" + settings.error_tag + "." + settings.error_class)
          wrapper = element.closest(settings.wrapper_tag)
          unless errorElement[0]?
            errorElement = $("<" + settings.error_tag + "/>",
              class: settings.error_class
              text: message
            )
            wrapper.append errorElement
          wrapper.addClass settings.wrapper_error_class
          errorElement.text message

        remove: (element, settings) ->
          errorElement = undefined
          wrapper = undefined
          wrapper = element.closest("" + settings.wrapper_tag + "." + settings.wrapper_error_class)
          wrapper.removeClass settings.wrapper_error_class
          errorElement = wrapper.find("" + settings.error_tag + "." + settings.error_class)
          errorElement.remove()

      bootstrap:
        add: (element, settings, message) ->
          errorElement = undefined
          wrapper_class_element = undefined
          wrapper_tag_element = undefined
          errorElement = element.parent().find("" + settings.error_tag + "." + settings.error_class)
          unless errorElement[0]?
            wrapper_tag_element = element.closest(settings.wrapper_tag)
            errorElement = $("<" + settings.error_tag + "/>",
              class: settings.error_class
              text: message
            )
            wrapper_tag_element.append errorElement
          wrapper_class_element = element.closest("." + settings.wrapper_class)
          wrapper_class_element.addClass settings.wrapper_error_class
          errorElement.text message

        remove: (element, settings) ->
          errorElement = undefined
          wrapper_class_element = undefined
          wrapper_tag_element = undefined
          wrapper_class_element = element.closest("." + settings.wrapper_class + "." + settings.wrapper_error_class)
          wrapper_tag_element = element.closest(settings.wrapper_tag)
          wrapper_class_element.removeClass settings.wrapper_error_class
          errorElement = wrapper_tag_element.find("" + settings.error_tag + "." + settings.error_class)
          errorElement.remove()

).call this