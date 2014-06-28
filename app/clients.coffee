@record_list = (items, schema) ->
  create_form i, schema for i in items

make_client = -> generate_xml_from_schema "client"

($ ".current_xml").append CLIENTS = ($ "<clients>").append make_client

@open_client = (client) ->
  menu_slide ->
   ($ "form").append magic_button(),
                     create_form client, SCHEMAS.client

clear_highlighting = ->
  ($ "form .record").removeClass "new selectd"

add_button = () ->
  (($ "<button>").text "Kunden erstellen").click (x) ->
    ($ "clients").prepend make_client()
    make_clients_form()
    clear_highlighting()
    f = ($ "form .record").first().addClass "new"
    x.preventDefault()

edit_button = (client) ->
  (($ "<button>").text "bearbeiten").click (x) ->
    open_client client
    x.preventDefault()

remove_button = (client) ->
  (($ "<button>").text "entfernen").click (x) ->
    e = ($ x.target).closest ".record"
    clear_highlighting()
    e.addClass "selected"
    if confirm "Diesen Eintrag wirklich entfernen?"
      client.remove()
      make_clients_form()
    e.removeClass "selected"
    x.preventDefault()

client_listrecord = (x) ->
  x = $ x
  (tr "record").append (create_form x, SCHEMAS.client),
                       (edit_button x),
                       (remove_button x)

client_list = (x) ->
  $.map ($ "clients client"), client_listrecord

client_list_headers = ->
  ($ "<th>").text desc for {desc} in SCHEMAS.client

make_clients_form = ->
    old_widgets = $.extend {}, WIDGETS
    $.extend WIDGETS, LIST_WIDGETS
    ($ ".arena form").empty().append (add_button)
    table = $ "<table>"
    table.append (thead "", tr "", (client_list_headers)),
                 (tbody "", client_list)
    ($ ".arena form").append table
    @WIDGETS = old_widgets

@open_clients = -> menu_slide make_clients_form
