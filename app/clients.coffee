@record_list = (items, schema) ->
  array_nodelist (create_form i, schema for i in items)

($ ".current_xml").append CLIENTS = [generate_xml_from_schema "client"]

@open_client = () ->
  menu_slide () -> ($ "form").append magic_button(),
                                     create_form ($ ".current_xml client"), SCHEMAS.client

@open_clients = () ->
  menu_slide () ->
               old_struct = WIDGETS.struct
               open_client()
