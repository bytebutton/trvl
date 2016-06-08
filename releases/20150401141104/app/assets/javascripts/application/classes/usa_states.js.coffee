class TravelLink.Classes.UsaStates extends TravelLink.Classes.BaseClass
  constructor: ->
    @$countries = $ ".country-selector"
    @$provinces = $ ".province-selector"
    @$states    = $ ".state-selector"

    @$countries.on 'change', (event) =>
      $el = $(event.currentTarget)
      toggle_id = $el.data('toggle-id')
      if $el.find("option:selected").val() is "251"
        @$provinces.filter("[data-toggle-id=#{toggle_id}]").closest('.control-group').hide()
        @$states.filter("[data-toggle-id=#{toggle_id}]").closest('.control-group').show()
      else
        @$provinces.filter("[data-toggle-id=#{toggle_id}]").closest('.control-group').show()
        @$states.filter("[data-toggle-id=#{toggle_id}]").closest('.control-group').hide()
    .trigger('change')
