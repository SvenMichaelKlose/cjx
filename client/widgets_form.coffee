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

field_label = ({name, desc}) ->
  (label().attr "for",name).text desc + ":"

measure = (field) ->
  (($ "<span>").text m) if m = (expand_type field).measure

struct_div = -> (div().addClass "struct")

struct = ({desc, data}, value, xml) ->
  struct_div().append (($ "<h2>").text desc),
                      (create_form xml, data)

record_div = -> (div().addClass "field")

record = (field, value, xml) ->
  if field.type is "struct"
     widget "struct", field, value, xml
  else
    f = expand_type $.extend true, {}, field
    r = record_div()
    record_div().append (field_label field),
                        (hook_field xml, field, widget f.type, f, value, xml),
                        (measure field)

xreflist_empty = (field, value, xml) ->
  "Leer."

xref_selector = (field, x) ->
  "[" + field.id_field + "='" + x.text() + "']"

get_xrefs = (field, xml) ->
  xml.children().map (x) -> RECORDS[field.records].find xref_selector field, x

xreflist = (field, value, xml) ->
  if xml.children().length
    (get_xrefs field, xml).map (x) -> widget field.type, field.data, null, x
  else
    widget "xreflist_empty", field, null, xml

@WIDGETS =
  textline:   text_input
  tel:        text_input
  zip_de:     text_input
  percent:    text_input
  pixel:      text_input
  seconds:    text_input
  minutes:    text_input
  color:      text_input
  email:      text_input
  password:   password
  range:      range
  boolean:    boolean
  textarea:   textarea
  image:      image_selection
  selection:  selection
  label:      field_label
  measure:    measure
  record:     record
  struct:     struct
  user:       text_input
  xreflist:   xreflist
  xreflist_empty: (x) -> null
