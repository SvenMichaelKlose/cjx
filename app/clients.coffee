($ ".current_xml").append CLIENTS = ($ "<clients>").append generate_xml_from_schema "client"

@open_clients = ->
  menu_slide ->
    make_form (
      containment: ($ "form"),
      parent:      ($ "clients"),
      schema:      "client"
    )
