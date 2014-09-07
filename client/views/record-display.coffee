root = @

fieldDiv = -> (div().addClass "field")

inline = -> [
  td().append fieldLabel()
  td().append xml.connectInput field, renderField()
  td().append measure()
]

block = -> [
#  td().append fieldLabel()
  (td().attr "colspan", 2).append root[field.type]()
]

fieldview = ->
  if isRecordType field.type
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
  zipDE:     value
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
