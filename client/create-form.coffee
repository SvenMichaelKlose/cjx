get_field_input = (parent, x) ->
  (ensure_element parent.children x.name) or if parent.attr name then parent

form_field = (parent, field) ->
  if field.attr
    parent.attr name, v = parent.attr name or value
    widget "record", field, v, parent
  else
    n = get_field_input parent, field
    debugger if not n
    v = n.text()
    widget "record", field, v, n

@create_form = (xml, fields) ->
  form_field xml, x for x in fields
