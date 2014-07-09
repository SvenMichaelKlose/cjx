text_input = ({type, name}, v) ->
  $ "<input>"
    type:   type
    name:   name
    value:  v

range = ({name, min, max, step}, v) ->
  e = $ "<input>"
        name:   name
        value:  v
  e.spinner
    min:  min
    max:  max
    step: step

password = ({name, value}, v) ->
  text_input {type: "password", name: name}, v

boolean = ({name, value}, v) ->
  e = text_input {type: "checkbox", name: name}, "true"
  e.attr "checked", "checked" if v is "true"
  e

textarea = ({name, cols, rows}, value) ->
  e = $ "<textarea>"
        name: name
        cols: cols || 60
        rows: rows || 12
  e.text value

image_selection = ({src}, value) ->
  $ "<img>"
    src: src

option = (txt, value) ->
  o = ($ "<option>").text txt
  o.attr "selected", "selected" if txt is value
  o.attr value: txt

selection = (field, value) ->
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
