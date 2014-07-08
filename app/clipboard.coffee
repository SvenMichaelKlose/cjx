@open_clipboard = ->
  menu_slide ->
    ($ ".arena form").remove()
    make_new_form
      parent: RECORDS["clipboard"]
      schema: "clipboard"
      desc:   "Ablage"

client_by_name = (name) ->
  (RECORDS["clients"].find "user:contains('#{name}')").parent()

clipboard_client_by_name = (name) ->
  RECORDS["clipboard"].children "[name='#{name}']"

client_xref = (name) ->
  if ensure_element client_by_name name
    $ "<client>", name: name

@add_to_clipboard = (names) ->
  for name in names
    if not (clipboard_client_by_name name).length
      RECORDS["clipboard"].append client_xref name
