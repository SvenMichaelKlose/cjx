###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

create_text_input = ({type, name, value}, v) ->
  e = $ "<input>"
        type:   type
        name:   name
        value:  if type is "checkbox" then "true" else v
  if type is "checkbox" && value
    e.attr "checked", "checked"
  e

create_textarea = ({name, cols, rows}, value) ->
  $ "<textarea>",
    name: name
    cols: cols || 60
    rows: rows || 12,
    value

create_image_selection = ({src}, value) ->
  $ "<img>"
    src: src

create_option = (txt, value) ->
  o = ($ "<option>").text txt
  o.attr value: txt
  o.attr "selected", "selected" if txt is value
  o

create_selection = (field, value) ->
  ($ "<select>").append (create_option txt, value for txt in field.opts)

INPUTCONSTRUCTORS =
  textline:  create_text_input
  tel:       create_text_input
  textarea:  create_textarea
  image:     create_image_selection
  selection: create_selection

create_input = (field, value) ->
  field = extend_field_type field
  e = (INPUTCONSTRUCTORS[field.type] || create_text_input) field, value
  if f = field.filter
    f field, e
  else
    e
