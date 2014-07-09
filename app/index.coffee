@ID_CLIENT = "pixel"

init = ->
  ($ ".menu").empty()
  ($ ".arena").hide()
  ($ ".arena").append $ "<form>"
  ($ "body").append ($ "<div class='rev'>").text "Revision " + REVISION
  make_menu_bar()

$ ->
  init()
  init_records "clients"
  init_records "groups"
  get_records ["clients", "groups"]
  init_clipboard()
  init_views [VIEWS_RECORD, VIEWS_RECORD_DISPLAY, VIEWS_STRUCTURAL, VIEWS_XREF]
  open_clients()
