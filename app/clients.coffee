@make_new_form = ->
  with_mixin [{records: parent.children()}, VIEWS_TABLE, VIEWS_TABLE_EDIT], ->
    ($ ".arena").append make_containment().append list()

@open_clients = ->
  with_mixin
    parent: RECORDS["clients"]
    schema: "client"
    desc:   "Kunden"
    -> (form = make_new_form()).append button_selected_to_clipboard form
