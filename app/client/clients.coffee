###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

record_list = (items, schema) ->
  create_form i, schema for i in items

CLIENTS = [generate_xml_from_schema "client"]

open_clients = () ->
  menu_slide () ->
               ($ "form").append (($ "<button>").text "Magic").click magic
               ($ "form").append i for i in record_list CLIENTS, SCHEMAS.client
