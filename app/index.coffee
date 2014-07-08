@ID_CLIENT = "pixel"

init_document = ->
  ($ ".menu").empty()
  ($ ".arena").hide()
  ($ ".arena").append $ "<form>"
  ($ "body").append ($ "<div class='rev'>").text "Revision " + REVISION

$ ->
  init_records "clients"
  init_records "groups"
  init_records "clipboard"
  get_records ["clients", "groups"]
  init_document()
  make_menu_bar()
  open_clients()
