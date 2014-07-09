record = (field, v, xml, options) ->
  if is_record_type field.type
    f = expand_type field
    td().append (render f.type, f, v, options),
                (render "measure", field, null, options)

@VIEWS_TABLE =
  record:          record
  struct:          -> null
  record_selector: -> null
  button_add:      -> null
  button_edit:     -> null
  button_remove:   -> null
