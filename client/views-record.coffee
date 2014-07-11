field_label = ->
  (label().attr "for", field.name).text  field.desc + ":"

measure = ->
  span().text m if m = (expand_type field).measure

@VIEWS_RECORD =
  fieldview:   -> div().text "Missing field template."
  record:      -> div().text "Missing record template."
  list:        -> div().text "Missing list template."
  field_label: field_label
  measure:     measure
