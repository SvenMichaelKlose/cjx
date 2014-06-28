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
  e = $ "<textarea>",
        name: name
        cols: cols || 60
        rows: rows || 12,
  e.text value

image_selection = ({src}, value) ->
  $ "<img>"
    src: src

option = (txt, value) ->
  o = ($ "<option>").text txt
  o.attr value: txt
  o.attr "selected", "selected" if txt is value
  o

selection = (field, value) ->
  ($ "<select>").append (option txt, value for txt in field.opts)

field_label = ({name, desc}) ->
  ($ "<label for=\"#{name}\">").text desc + ":"

measure = (field) ->
  (($ "<span>").text m) if m = (expand_type field).measure

record = (field, value) ->
  f = expand_type $.extend true, {}, field
  (div().addClass "field").append (field_label field),
                                  (widget f.type, f, value),
                                  (measure field)

struct = ({desc, data}, xml) ->
  (div().addClass "struct").append (($ "<h2>").text desc),
                                   (create_form xml, data)

@WIDGETS =
  textline:  text_input
  tel:       text_input
  zip_de:    text_input
  percent:   text_input
  pixel:     text_input
  seconds:   text_input
  minutes:   text_input
  color:     text_input
  email:     text_input
  password:  password
  range:     range
  boolean:   boolean
  textarea:  textarea
  image:     image_selection
  selection: selection
  label:     field_label
  measure:   measure
  record:    record
  struct:    struct
