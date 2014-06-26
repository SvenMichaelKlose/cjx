###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

magic = (x) ->
  alert ($ ".current_xml")[0].innerHTML
  x.preventDefault()

open_preferences = () ->
  menu_slide () ->
               xml = (ensure_element $ ".current_xml > app") or $ "<app>"
               ($ "form").empty()
               button = (($ "<button>").text "Magic").click magic
               ($ "form").append button,
                                 create_form xml, SCHEMAS.app
               unless (ensure_element $ ".current_xml > app")
                 ($ ".current_xml").empty().append xml
