@open_clients = ->
  debugger
  xroot = xml_root "clients"
  with_mixin [
      VIEWS_LIST_EDIT
      VIEWS_SELECTION
      records: xroot.children()
      parent:  xroot
      schema:  SCHEMAS["client"]
      schema_name: "client"
      desc:    "Kunden"
    ], -> [
      tableview(),
      button_selected_to_clipboard()
    ]
