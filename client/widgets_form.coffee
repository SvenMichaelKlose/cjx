###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

create_text_input = ({type, name, value}, v) ->
  e = $ "<input>"
        type:   type
        name:   name
        value:  if type is "checkbox" then "true" else v
  if type is "checkbox" && value
    e.attr "checked", "checked"
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

measure = (field) ->
  (($ "<span>").text m) if m = (extend_field_type field).measure

create_form_record = (field, value) ->
  ($ "<div class='field'>").append (field_label field),
                                   (create_widget field.type, (extend_field_type field), value),
                                   (create_measure_label field)

create_form_struct = ({desc, data}) ->
  div = $ "<div class='struct'>"
  div.append (($ "<h2>").text desc),
             create_form xml, data

WIDGETS =
  textline:  create_text_input
  tel:       create_text_input
  textarea:  create_textarea
  image:     create_image_selection
  selection: create_selection
  label:     field_label
  measure:   measure
  record:    create_form_record
  struct:    create_form_struct
