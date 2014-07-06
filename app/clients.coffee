init_records "clients"
init_records "groups"

@open_clients = ->
  menu_slide ->
    ($ ".clientform").remove()
    ($ ".groupform").remove()
    ($ ".arena").append form().addClass "clientform"
    ($ ".arena").append form().addClass "groupform"
    make_form (
      containment: ($ ".clientform"),
      parent:      RECORDS["clients"],
      schema:      "client",
      desc:        "Kunden"
    )
    make_form (
      containment: ($ ".groupform"),
      parent:      RECORDS["groups"],
      schema:      "group",
      desc:        "Gruppen"
    )
