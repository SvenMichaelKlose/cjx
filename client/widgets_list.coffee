value    = (field, v) -> v
boolean  = (field, v) -> if v is "true" then "ja" else "nein"
password = (field, v) -> null
image    = (field, v) -> null
struct   = (field, xml) -> null

record = (field, v, xml, options) ->
  if is_record_type field.type
    f = expand_type field
    (td().addClass "listfield").append (widget f.type, f, v, options),
                                       (widget "measure", field, null, options)

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
  user:      value
