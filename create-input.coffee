###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

create_text_input = (field) ->
  $ "<input>"
    type:   field.type
    length: 40
    name:   field.name
    value:  field.value

create_textarea = (field) ->
  $ "<textarea>",
    name: field.name
    cols: 60
    rows: 12,
    field.value

create_image_selection = (field) ->
  $ "<img>"
    src: field.src

create_option = (txt, field) ->
  o = ($ "<option>").text txt
  o.attr "value", txt
  if txt is field.value
    o.attr "selected", "selected"
  o

create_selection = (field) ->
  ($ "<select>").append (create_option txt, field for txt in field.opts)

INPUTCONSTRUCTORS =
  textline:  create_text_input
  tel:       create_text_input
  text:      create_textarea
  image:     create_image_selection
  selection: create_selection

extend_field_type = (field) ->
  filter = field.filter
  desc = field.desc
  if t = TYPES[field.type]
    $.extend field, t
    delete field.type if not t.type
    field = extend_field_type field
    if filter
      field.filter = filter
    if desc
      field.desc = desc
  field

create_input = (field) ->
  field = extend_field_type field
  e = (INPUTCONSTRUCTORS[field.type] || create_text_input) field
  if f = field.filter
    f field, e
  else
    e
