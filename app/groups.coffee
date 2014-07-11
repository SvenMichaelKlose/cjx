root = this

button_add_clients_from_clipboard = ->
   button().text clipboard_items().length + " Kunden aus Ablage einfügen."

schema_names_except = (x) ->
  for {name} in SCHEMAS[schema]
    if name isnt x
      name

group = (record, xreflist) -> [
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
     ], ->
       debugger
       render_record()
]

@open_groups = ->
  with_mixin [
      schema: "group"
      parent: RECORDS["groups"]
      desc:   "Gruppen"
      VIEWS_TABLE
      VIEWS_TABLE_EDIT
    ], ->
      with_mixin [
          ignore:  ["clients"]
          records: parent.children()
        ], ->
          ($ ".arena").append make_containment().append list(),
                                                        ensure_element_array group record, xreflist
