create_text_input = (field) ->
  $ "<input>"
    type: field.type
    name: field.name

create_image_selection = (field) ->
  $ "<img>"
    src: field.src

INPUTCONSTRUCTORS =
  text:  create_text_input
  tel:   create_text_input
  image: create_image_selection

create_input = (field) ->
  if t = TYPES[field.type]
    field.type = t.type
    field = $.extend t, field
  (INPUTCONSTRUCTORS[field.type] || create_text_input) field
