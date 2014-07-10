root = this

value    = () -> root.value
boolean  = () -> if root.value is "true" then "ja" else "nein"
password = () -> null
image    = () -> null

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
