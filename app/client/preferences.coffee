###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

magic = (x) ->
  alert ($ ".current_xml")[0].innerHTML
  x.preventDefault()

($ ".current_xml").append APPS = [generate_xml_from_schema "app"]

open_preferences = () ->
  open_form "app", create_form
