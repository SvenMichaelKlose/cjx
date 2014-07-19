@open_clients = ->
  with_mixin [
      VIEWS_LIST_EDIT
      VIEWS_SELECTION
      records: RECORDS["clients"].children()
      parent:  RECORDS["clients"]
      schema:  SCHEMAS["client"]
      schema_name: "client"
      desc:    "Kunden"
    ], -> [
      tableview(),
      button_selected_to_clipboard()
    ]
