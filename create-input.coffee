create_text_input = (field) ->
  $ "<input>"
    type: field.type
    name: field.name

create_image_selection = (field) ->
  $ "<img>"
    src: field.src

ELMGEN =
    text:   create_text_input
    tel:    create_text_input
    image:  create_image_selection

field_label = (field) ->
    $("<label>").text field.desc + ":"

create_input = (field) ->
    ELMGEN[field.type] field
