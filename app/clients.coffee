($ ".current_xml").append CLIENTS = ($ "<clients>").append generate_xml_from_schema "client"
($ ".current_xml").append GROUPS = ($ "<groups>").append generate_xml_from_schema "group"

@open_clients = ->
  menu_slide ->
    ($ ".group").remove()
    ($ ".arena").append form().addClass "group"
    make_form (
      containment: ($ "form"),
      parent:      ($ "clients"),
      schema:      "client"
    )
    make_form (
      containment: ($ ".group"),
      parent:      ($ "groups"),
      schema:      "group"
    )
