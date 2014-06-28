($ ".current_xml").append CLIENTS = ($ "<clients>")
($ ".current_xml").append GROUPS = ($ "<groups>")

@open_clients = ->
  menu_slide ->
    ($ ".groupform").remove()
    ($ ".arena").append form().addClass "groupform"
    make_form (
      containment: ($ "form"),
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
