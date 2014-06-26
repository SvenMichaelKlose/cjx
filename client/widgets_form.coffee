###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

create_text_input = ({type, name}, v) ->
  $ "<input>"
    type:   type
    name:   name
    value:  v

create_range = ({name, min, max, step}, v) ->
  e = $ "<input>"
        name:   name
        value:  v
  e.spinner
    min:  min
    max:  max
    step: step

create_password = ({name, value}, v) ->
  create_text_input {type: "password", name: name}, v

create_boolean = ({name, value}, v) ->
  e = create_text_input {type: "checkbox", name: name}, "true"
  e.attr "checked", "checked" if v is "true"
  e

create_textarea = ({name, cols, rows}, value) ->
  $ "<textarea>",
    name: name
    cols: cols || 60
    rows: rows || 12,
    value

create_image_selection = ({src}, value) ->
  $ "<img>"
    src: src

create_option = (txt, value) ->
  o = ($ "<option>").text txt
  o.attr value: txt
  o.attr "selected", "selected" if txt is value
  o

create_selection = (field, value) ->
  ($ "<select>").append (create_option txt, value for txt in field.opts)

field_label = ({name, desc}) ->
  ($ "<label for=\"#{name}\">").text desc + ":"

measure_label = (field) ->
  (($ "<span>").text m) if m = (extend_field_type field).measure

create_form_record = (field, value) ->
  f = extend_field_type $.extend true, {}, field
  ($ "<div class='field'>").append (field_label field),
                                   (create_widget f.type, f, value),
                                   (measure_label field)

create_form_struct = ({desc, data}, xml) ->
  div = $ "<div class='struct'>"
  div.append (($ "<h2>").text desc),
             create_form xml, data

WIDGETS =
  textline:  create_text_input
  tel:       create_text_input
  zip_de:    create_text_input
  percent:   create_text_input
  pixel:     create_text_input
  seconds:   create_text_input
  minutes:   create_text_input
  color:     create_text_input
  email:     create_text_input
  password:  create_password
  range:     create_range
  boolean:   create_boolean
  textarea:  create_textarea
  image:     create_image_selection
  selection: create_selection
  label:     field_label
  measure:   measure_label
  record:    create_form_record
  struct:    create_form_struct
