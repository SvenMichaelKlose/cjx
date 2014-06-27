###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

record_list = (items, schema) ->
  array_nodelist (create_form i, schema for i in items)

($ ".current_xml").append CLIENTS = [generate_xml_from_schema "client"]

open_clients = () ->
  open_form "client", () -> record_list CLIENTS, SCHEMAS.client
