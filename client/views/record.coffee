fieldLabel = ->
  (label().attr "for", field.name).text field.desc + ":"

measure = ->
  span().text m if m = (expandType field).measure

heading = ->
  h2().text desc

@VIEWS_RECORD =
  fieldLabel:  fieldLabel
  measure:     measure
  heading:     heading
