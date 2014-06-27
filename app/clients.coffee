@record_list = (items, schema) ->
  array_nodelist (create_form i, schema for i in items)

($ ".current_xml").append CLIENTS = [generate_xml_from_schema "client"]

@open_clients = () ->
  old_struct = WIDGETS.struct
  open_form "client", () -> record_list CLIENTS, SCHEMAS.client

@open_client = () ->
  open_form "client", create_form, SCHEMAS.client
