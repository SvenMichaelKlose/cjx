root = this

button_add_clients_from_clipboard = ->
   button().text clipboard_items().length + " Kunden aus Ablage einfügen."

group = (record, xreflist) -> [
   record(),
   button_add_clients_from_clipboard(),
   with_mixin [
       record_selector: do_nothing
       ignore:   for {name} in SCHEMAS[schema]
                   if name isnt "clients"
                     name
       button_add: do_nothing
       xreflist: -> with_mixin [
           VIEWS_TABLE
           VIEWS_TABLE_EDIT
           heading:    do_nothing
        ], xreflist
     ], render_record
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
          record:  (do (record, xreflist) -> -> group record, xreflist)
          records: parent.children()
        ], ->
          ($ ".arena").append make_containment().append list()
