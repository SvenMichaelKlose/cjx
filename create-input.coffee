###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

create_text_input = (field, value) ->
  $ "<input>"
    type:   field.type
    length: 40
    name:   field.name
    value:  value

create_textarea = (field, value) ->
  $ "<textarea>",
    name: field.name
    cols: 60
    rows: 12,
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
  text:      create_textarea
  image:     create_image_selection
  selection: create_selection

create_input = (field, value) ->
  field = extend_field_type field
  e = (INPUTCONSTRUCTORS[field.type] || create_text_input) field, value
  if f = field.filter
    f field, e
  else
    e
