field_label = ({name, desc}) ->
  (label().attr "for",name).text desc + ":"

measure = (field) ->
  (($ "<span>").text m) if m = (expand_type field).measure

@VIEWS_RECORD =
  label:    field_label
  measure:  measure
