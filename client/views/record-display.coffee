root = @

field_div = -> (div().addClass "field")

inline = -> [
  td().append_nested field_label()
  td().append_nested xml.connect_input field, render_field()
  td().append_nested measure()
]

block = -> [
#  td().append_nested field_label()
  (td().attr "colspan", 2).append_nested root[field.type]()
]

fieldview = ->
  if is_record_type field.type
    inline()
  else
    block()

value    = -> root.value
boolean  = -> if root.value is "true" then "yes" else "no"
password = -> "secret"

@VIEWS_RECORD_DISPLAY =
  fieldview: fieldview
  textline:  value
  tel:       value
  zip_de:    value
  percent:   value
  pixel:     value
  seconds:   value
  minutes:   value
  color:     value
  email:     value
  url:       value
  password:  password
  range:     value
  boolean:   boolean
  textarea:  value
  selection: value
  user:      value
