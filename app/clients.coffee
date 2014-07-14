@open_clients = ->
  with_mixin [
      VIEWS_TABLE
      VIEWS_TABLE_EDIT
      records: RECORDS["clients"].children()
      parent: RECORDS["clients"]
      schema: SCHEMAS["client"]
      schema_name: "client"
      desc:   "Kunden"
    ], -> ($ ".arena").append (make_containment().append_nested list()),
                              button_selected_to_clipboard form()
