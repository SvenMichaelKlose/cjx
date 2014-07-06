RECORDS = {}

init_records = (name) ->
  ($ ".current_xml").append RECORDS[name] = ($ "<#{name}>")

init_records "clients"
init_records "groups"

@open_clients = ->
  menu_slide ->
    ($ ".groupform").remove()
    ($ ".arena").append form().addClass "clientform"
    ($ ".arena").append form().addClass "groupform"
    make_form (
      containment: ($ ".clientform"),
      parent:      ($ "clients"),
      schema:      "client",
      desc:        "Kunden"
    )
    make_form (
      containment: ($ ".groupform"),
      parent:      ($ "groups"),
      schema:      "group",
      desc:        "Gruppen"
    )
