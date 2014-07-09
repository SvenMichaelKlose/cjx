record = (options, xml, field, value) ->
  if is_record_type field.type
    f = expand_type field
    td().append (render f.type, options, xml, f, value),
                (render "measure", options, xml, field, value)

@VIEWS_TABLE =
  record:          record
  struct:          -> null
  record_selector: -> null
  button_add:      -> null
  button_edit:     -> null
  button_remove:   -> null
