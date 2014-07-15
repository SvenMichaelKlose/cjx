root = @

button_txt_add_clients_from_clipboard = ->
  num = clipboard_items().length
  num + " Kunde#{if num is 1 then "" else "n"} aus Ablage einfügen."

button_add_clients_from_clipboard = ->
  b = button().text button_txt_add_clients_from_clipboard()
  b.click do (parent) -> (x) ->
            x.preventDefault()
            clients = parent.find "clients"
            for i in ($ "clipboard clients").children()
              i = $ i
              if not (clients.find "[name=#{i.attr "name"}]").length
                clients.append client_xref i.attr "name"
            menu_reopen()

schema_names_except = (x) ->
  for {name} in schema
    if name isnt x
      name

group_clients = (xreflist, x) -> [
  button_add_clients_from_clipboard(),
  with_mixin [
      xml:      x
      ignore:   schema_names_except "clients"
      xreflist: -> with_mixin [
        record_selector: null
        heading:         null
        button_add:      null
        list_empty: -> div().text "Dieser Gruppe sind noch keine Kunden zugeordnet."
      ], xreflist
    ], render_record
]

group = (x) ->
  with_mixin [
      VIEWS_LIST_EDIT
      schema:  SCHEMAS["group"]
      schema_name: "group"
      records: [x]
      parent:  RECORDS["groups"]
      desc:    "Gruppen"
      ignore:  ["clients"]
      button_add: null
      heading: null
    ], ->
      div().append_nested tableview(),
                          group_clients xreflist, x

@open_groups = -> [
  h2().text "Gruppen"
  with_mixin
    schema_name: "group"
    parent:      RECORDS["groups"]
    VIEWS_LIST_EDIT.button_add
  group ($ x) for x in RECORDS["groups"].children()
]
