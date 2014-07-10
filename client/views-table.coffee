fieldview = () ->
  if is_record_type field.type
    td().append render_field(),
                measure()

@VIEWS_TABLE =
  fieldview:       fieldview
  struct:          -> null
  record_selector: -> null
  button_add:      -> null
  button_edit:     -> null
  button_remove:   -> null
