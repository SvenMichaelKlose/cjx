field_label = ->
  (label().attr "for", field.name).text  field.desc + ":"

measure = ->
  span().text m if m = (expand_type field).measure

record_title = -> h2().text desc

record = -> [
  record_title()
]

heading = -> h1().text desc

@VIEWS_RECORD =
  list:        -> div().text "Missing list template."
  field_label: field_label
  measure:     measure
  heading:     heading
