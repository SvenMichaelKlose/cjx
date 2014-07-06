@ID_CLIENT = "pixel"

init_document = ->
  ($ ".menu").empty()
  ($ ".arena").hide()
  ($ ".arena").append $ "<form>"
  ($ "body").append ($ "<div class='rev'>").text "Revision " + REVISION

$ ->
  init_records "clients"
  init_records "groups"
  get_records()
  init_document()
  make_menu_bar()
  open_clients()
