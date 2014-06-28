value    = (field, v) -> v
boolean  = (field, v) -> if v is "true" then "ja" else "nein"
password = (field, v) -> null
image    = (field, v) -> null
struct   = (field, xml) -> null

record = (field, v) ->
  f = extend_field_type $.extend true, {}, field
  (td().addClass "listfield").append (widget f.type, f, v),
                                     (widget "measure", field)

@LIST_WIDGETS =
  textline:  value
  tel:       value
  zip_de:    value
  percent:   value
  pixel:     value
  seconds:   value
  minutes:   value
  color:     value
  email:     value
  password:  password
  range:     value
  boolean:   boolean
  textarea:  value
  image:     image
  selection: value
  record:    record
  struct:    struct
