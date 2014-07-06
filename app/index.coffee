ID_CLIENT = "pixel"

$ ->
  ($ ".arena").hide()
  ($ ".arena").append $ "<form>"
  ($ "body").append ($ "<div class='rev'>").text "Revision " + REVISION
  make_menu_bar()
  open_clients()
  #alert (generate_xml_from_schema "app")[0].innerHTML
