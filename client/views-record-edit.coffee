text_input = ->
  $ "<input>"
    type:   field.type
    name:   field.name
    value:  value

range = ->
  e = $ "<input>"
        name:   field.name
        value:  value
  e.spinner
    min:  field.min
    max:  field.max
    step: field.step

password = ->
  with_mixin [{field: {type: "password", name: name}}], text_input

boolean = ->
  with_mixin [{field: {type: "checkbox", name: name}, value: "true"}], text_input
  e.attr "checked", "checked" if value is "true"
  e

textarea = ->
  e = $ "<textarea>"
        name: field.name
        cols: field.cols || 60
        rows: field.rows || 12
  e.text value

image_selection = ->
  $ "<img>"
    src: value

option = (txt, value) ->
  o = option().text txt
  o.attr "selected", "selected" if txt is value
  o.attr value: txt

selection = ->
  select().append (option txt, value for txt in field.opts)

@VIEWS_RECORD_EDIT =
  textline:       text_input
  tel:            text_input
  zip_de:         text_input
  percent:        text_input
  pixel:          text_input
  seconds:        text_input
  minutes:        text_input
  color:          text_input
  email:          text_input
  password:       password
  range:          range
  boolean:        boolean
  textarea:       textarea
  image:          image_selection
  selection:      selection
  user:           text_input
