###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

create_text_input = (field, value) ->
  e = $ "<input>"
        type:   field.type
        name:   field.name
        value:  if field.type is "checkbox"
                   "true"
                else
                   value
  if field.type is "checkbox" && field.value
    e.attr "checked", "checked"
  e

create_textarea = (field, value) ->
  $ "<textarea>",
    name: field.name
    cols: field.cols || 60
    rows: field.rows || 12,
    value

create_image_selection = (field, value) ->
  $ "<img>"
    src: field.src

create_option = (txt, field, value) ->
  o = ($ "<option>").text txt
  o.attr "value", txt
  if txt is value
    o.attr "selected", "selected"
  o

create_selection = (field, value) ->
  ($ "<select>").append (create_option txt, field, value for txt in field.opts)

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
