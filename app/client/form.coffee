###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

magic = (x) ->
  alert ($ ".current_xml")[0].innerHTML
  x.preventDefault()

open_form = (schema_name, renderer) ->
  menu_slide () ->
               unless xml = (ensure_element $ ".current_xml > #{schema_name}")
                 xml = ($ "<#{schema_name}>").appendTo $ ".current_xml"
               button = (($ "<button>").text "Magic").click magic
               ($ "form").append button, renderer xml, SCHEMAS[schema_name]
