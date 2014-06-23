create_text_input = (field) ->
  $ "<input>"
    type:  field.type
    name:  field.name
    value: field.value

create_image_selection = (field) ->
  $ "<img>"
    src: field.src

INPUTCONSTRUCTORS =
  text:  create_text_input
  tel:   create_text_input
  image: create_image_selection

extend_field_type = (field) ->
  filter = field.filter
  if t = TYPES[field.type]
    $.extend field, t
    delete field.type if not t.type
    field = extend_field_type field
    if filter
      field.filter = filter
  field

create_input = (field) ->
  field = extend_field_type field
  e = (INPUTCONSTRUCTORS[field.type] || create_text_input) field
  if f = field.filter
     f field, e
  e
