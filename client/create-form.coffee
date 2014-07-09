get_field_input = (parent, field) ->
  (ensure_element parent.children field.name) or if parent.attr name then parent

form_field = (options, parent, field) ->
  if field.attr
    parent.attr name, v = parent.attr name or value
    widget "record", field, v, parent, options
  else
    n = get_field_input parent, field
    debugger if not n
    v = n.text()
    widget "record", field, v, n, options

@render_record = (xml, fields, options) ->
  form_field options, xml, field for field in fields
