@record_list = (items, schema) ->
  create_form i, schema for i in items

make_client = -> generate_xml_from_schema "client"

($ ".current_xml").append CLIENTS = ($ "<clients>").append make_client

@open_client = (client) ->
  menu_slide ->
   ($ "form").append magic_button(),
                     create_form ($ "clients client"), SCHEMAS.client

add_button = () ->
  (($ "<button>").text "Kunden erstellen").click (x) ->
    ($ "clients").append make_client()
    make_clients_form()
    x.preventDefault()

remove_button = (client) ->
  (($ "<button>").text "entfernen").click (x) ->
    client.remove()
    make_clients_form()
    x.preventDefault()

client_listrecord = (x) ->
  x = $ x
  (tr "listrecord").append ($ "<input>", type: "checkbox"),
                           (create_form x, SCHEMAS.client),
                           remove_button x

client_list = (x) ->
  table().append $.map ($ "clients client"), client_listrecord

make_clients_form = ->
    old_widgets = $.extend {}, WIDGETS
    $.extend WIDGETS, LIST_WIDGETS
    ($ ".arena form").empty().append (add_button),
                                     (tbody "", client_list())
    @WIDGETS = old_widgets

@open_clients = -> menu_slide make_clients_form
