@make_new_form = ->
  with_mixin [
      VIEWS_TABLE
      VIEWS_TABLE_EDIT
      records: parent.children()
    ], -> ($ ".arena").append make_containment().append_nested list()

@open_clients = ->
  with_mixin [
      parent: RECORDS["clients"]
      schema: "client"
      desc:   "Kunden"
    ], -> (form = make_new_form()).append button_selected_to_clipboard form
