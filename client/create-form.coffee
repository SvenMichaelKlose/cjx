get_field_input = (parent, x) ->
  (ensure_element parent.children x.name) or if parent.attr name then parent

hooked_field = (n, field, v) ->
  hook_field n, field, widget "record", field, v

attribute_value = (parent, {name, value}) ->
  if not parent.attr name
    parent.attr name, value
    value
  else
    parent.attr name

attribute = (parent, field) ->
  hooked_field parent, field, attribute_value parent, field

element = (parent, field) ->
  v = field.value
  if n = get_field_input parent, field
    v = n.text()
  else
    parent.append n = ($ "<#{field.name}>")
    n.text v
  if field.type is "struct"
    widget "struct", field, n
  else
    hooked_field n, field, v

form_field = (parent, field) ->
  (if field.attr then attribute else element) parent, field

@create_form = (xml, fields) ->
  form_field xml, x for x in fields
