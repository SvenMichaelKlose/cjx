###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

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
