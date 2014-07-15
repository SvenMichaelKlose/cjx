clipboard_clients = -> $ ".db clipboard clients"
@clipboard_items = -> clipboard_clients().children()

menubutton_text = ->
  "Ablage (" + (clipboard_items().length || "leer") + ")"

update_clipboard_button = ->
  ($ ".menubutton_clipboard").text menubutton_text()

client_by_name = (name) ->
  (RECORDS["clients"].find "user:contains('#{name}')").parent()

clipboard_client_by_name = (name) ->
  clipboard_clients().children "[name='#{name}']"

@client_xref = (name) ->
  if ensure_element client_by_name name
    $ "<client>", name: name

@add_client_xrefs = (to, names) ->
  for name in names
    if not (clipboard_client_by_name name).length
      to.append client_xref name

@add_to_clipboard = (names) ->
  add_client_xrefs clipboard_clients(), names
  
@open_clipboard = ->
  with_mixin [
    VIEWS_LIST_EDIT
    button_add:  null
    button_edit: null
    xml:      RECORDS["clipboard"]
    schema:   SCHEMAS["clipboard"]
    desc:     "Ablage"
  ], render_record

@button_selected_to_clipboard = (containment) ->
  (button().text "Auswahl in Ablage übernehmen").click (x) ->
    x.preventDefault()
    add_to_clipboard get_selected_record_names containment

@init_clipboard = ->
  ($ ".db").append RECORDS["clipboard"] = generate_xml_from_schema "clipboard"
  $(".db clipboard").bind "DOMSubtreeModified", update_clipboard_button
  update_clipboard_button()
