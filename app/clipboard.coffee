clipboard_clients = -> $ "clipboard clients"
clipboard_items = -> clipboard_clients().children()

menubutton_text = ->
  "Ablage (" + (clipboard_items().length || "leer") + ")"

@update_clipboard_button = ->
  ($ ".menubutton_clipboard").text menubutton_text()

client_by_name = (name) ->
  (RECORDS["clients"].find "user:contains('#{name}')").parent()

clipboard_client_by_name = (name) ->
  clipboard_clients().children "[name='#{name}']"

client_xref = (name) ->
  if ensure_element client_by_name name
    $ "<client>", name: name

@add_to_clipboard = (names) ->
  for name in names
    if not (clipboard_client_by_name name).length
      clipboard_clients().append client_xref name
  update_clipboard_button()

@open_clipboard = ->
  menu_slide ->
    ($ ".arena form").remove()
    ($ ".arena").append containment = make_containment()
    with_views [VIEWS_RECORD, VIEWS_RECORD_DISPLAY, VIEWS_LIST], ->
      r = render_record RECORDS["clipboard"],
                        SCHEMAS["clipboard"],
                        containment: containment
      containment.append r

@init_clipboard = ->
  ($ ".current_xml").append RECORDS["clipboard"] = generate_xml_from_schema "clipboard"
  update_clipboard_button()
