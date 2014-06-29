get_field_input = (parent, x) ->
  (ensure_element parent.children x.name) or if parent.attr name then parent

attribute_value = (parent, {name, value}) ->
  parent.attr name, value = parent.attr name or value
  value

attribute = (parent, field) ->
  widget "record", field, (attribute_value parent, field), parent

element = (parent, field) ->
  if n = get_field_input parent, field
    v = n.text()
  else
    parent.append n = ($ "<#{field.name}>")
    n.text v = field.value
  widget "record", field, v, n

form_field = (parent, field) ->
  (if field.attr then attribute else element) parent, field

@create_form = (xml, fields) ->
  form_field xml, x for x in fields
