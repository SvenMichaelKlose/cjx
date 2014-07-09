field = (options, xml, field, value) ->
  if is_record_type field.type
    td().append (render_field options, xml, field, value),
                (render "measure", options, xml, field, value)

@VIEWS_TABLE =
  field:           field
  struct:          -> null
  record_selector: -> null
  button_add:      -> null
  button_edit:     -> null
  button_remove:   -> null
