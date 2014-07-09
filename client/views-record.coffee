field_label = (options, xml, {name, desc}) ->
  (label().attr "for",name).text desc + ":"

measure = (options, xml, field) ->
  (($ "<span>").text m) if m = (expand_type field).measure

@VIEWS_RECORD =
  label:    field_label
  measure:  measure
