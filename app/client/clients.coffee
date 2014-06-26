###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

record_list = (xml, schema) ->
  create_form i schema for i in xml.children()

open_clients = () ->
  menu_slide () ->
               xml = if (ensure-element $ ".current_xml > clients") then $ "clients" else $ "<clients>"
               button = (($ "<button>").text "Magic").click magic
               ($ "form").append button,
                                 record_list xml, SCHEMAS.app
               unless (ensure-element $ ".current_xml > clients")
                 ($ ".current_xml").empty().append xml
