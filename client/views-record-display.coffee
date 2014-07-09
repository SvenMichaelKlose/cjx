value    = (field, v) -> v
boolean  = (field, v) -> if v is "true" then "ja" else "nein"
password = (field, v) -> null
image    = (field, v) -> null

@VIEWS_RECORD_DISPLAY =
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
  user:      value
