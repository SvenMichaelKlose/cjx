root = this

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
           ($ ".arena").empty()
           open_groups()

schema_names_except = (x) ->
  for {name} in schema
    if name isnt x
      name

group_clients = (record, xreflist) -> [
  button_add_clients_from_clipboard(),
  with_mixin [
      xml: parent.children()
      record_selector: do_nothing
      ignore:   schema_names_except "clients"
      xreflist: -> with_mixin [
          VIEWS_TABLE
          VIEWS_TABLE_EDIT
          heading:    do_nothing
          button_add: do_nothing
          list_empty: -> div().text "Dieser Gruppe sind noch keine Kunden zugeordnet."
       ], xreflist
    ], render_record
]

@open_groups = ->
  with_mixin [
      schema: SCHEMAS["group"]
      parent: RECORDS["groups"]
      desc:   "Gruppen"
      VIEWS_TABLE
      VIEWS_TABLE_EDIT
    ], ->
      with_mixin [
          ignore:  ["clients"]
          records: parent.children()
        ], ->
          ($ ".arena").append containment = make_containment()
          containment.append_nested list(),
                                    group_clients record, xreflist
