($ ".current_xml").append CLIENTS = ($ "<clients>")
($ ".current_xml").append GROUPS = ($ "<groups>")

@open_clients = ->
  menu_slide ->
    ($ ".group").remove()
    ($ ".arena").append form().addClass "group"
    make_form (
      containment: ($ "form"),
      parent:      ($ "clients"),
      schema:      "client",
      desc:        "Kunden"
    )
    make_form (
      containment: ($ ".group"),
      parent:      ($ "groups"),
      schema:      "group",
      desc:        "Gruppen"
    )
