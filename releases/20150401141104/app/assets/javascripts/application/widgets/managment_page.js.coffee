window.TravelLink.Widgets.Managment =

  init: (company_id) ->
    @company_id = company_id || 0
    @users()
    $('a[data-toggle="tab"]').on 'click',(e) =>
      $(".tab-pane").hide()
      @currentTable.destroy()
      $("##{$(e.currentTarget).data('resource')}").show()
      @[$(e.currentTarget).data('resource')]()

#  users: ->
#    @currentTable = $(".users-table").dataTable
#      "sAjaxSource": "/manager/companies/#{@company_id}/users"
#      "oTableTools": { "sSwfPath": "#{location.origin}/swf/copy_csv_xls_pdf.swf", "aButtons": ["csv", "xls", "pdf"] }
#
#  visas: ->
#    @currentTable = $(".visas-table").dataTable
#      "sAjaxSource": "/manager/companies/#{@company_id}/visas"
#      "oTableTools": { "sSwfPath": "#{location.origin}/swf/copy_csv_xls_pdf.swf", "aButtons": ["csv", "xls", "pdf"] }
#
#  passports: ->
#    @currentTable = $(".passports-table").dataTable
#      "sAjaxSource": "/manager/companies/#{@company_id}/passports"
#      "oTableTools": { "sSwfPath": "#{location.origin}/swf/copy_csv_xls_pdf.swf", "aButtons": ["csv", "xls", "pdf"] }
#
#  trips: ->
#    @currentTable = $(".trips-table").dataTable
#      "sAjaxSource": "/manager/companies/#{@company_id}/trips"
#      "oTableTools": { "sSwfPath": "#{location.origin}/swf/copy_csv_xls_pdf.swf", "aButtons": ["csv", "xls", "pdf"] }

  users: ->
    @currentTable = $(".users-table").DataTable
      "ajax": "/manager/companies/#{@company_id}/users"
      "tableTools"    : { "sSwfPath": "#{location.origin}/swf/copy_csv_xls_pdf.swf" }

  visas: ->
    @currentTable = $(".visas-table").DataTable
      "ajax": "/manager/companies/#{@company_id}/visas"
      "tableTools"    : { "sSwfPath": "#{location.origin}/swf/copy_csv_xls_pdf.swf" }

  passports: ->
    @currentTable = $(".passports-table").DataTable
      "ajax": "/manager/companies/#{@company_id}/passports"
      "tableTools"    : { "sSwfPath": "#{location.origin}/swf/copy_csv_xls_pdf.swf" }

  trips: ->
    @currentTable = $(".trips-table").DataTable
      "ajax": "/manager/companies/#{@company_id}/trips"
      "tableTools"    : { "sSwfPath": "#{location.origin}/swf/copy_csv_xls_pdf.swf" }