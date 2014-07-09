text_input = (options, xml, {type, name}, value) ->
  $ "<input>"
    type:   type
    name:   name
    value:  value

range = (options, xml, {name, min, max, step}, value) ->
  e = $ "<input>"
        name:   name
        value:  value
  e.spinner
    min:  min
    max:  max
    step: step

password = (options, xml, {name}, value) ->
  text_input options, xml, {type: "password", name: name}, value

boolean = (options, xml, {name}, value) ->
  e = text_input options, xml, {type: "checkbox", name: name}, "true"
  e.attr "checked", "checked" if value is "true"
  e

textarea = (options, xml, {name, cols, rows}, value) ->
  e = $ "<textarea>"
        name: name
        cols: cols || 60
        rows: rows || 12
  e.text value

image_selection = (options, xml, {src}, value) ->
  $ "<img>"
    src: src

option = (txt, value) ->
  o = ($ "<option>").text txt
  o.attr "selected", "selected" if txt is value
  o.attr value: txt

selection = (options, xml, field, value) ->
  ($ "<select>").append (option txt, value for txt in field.opts)

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
