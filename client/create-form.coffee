###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

get_field_input = (parent, x) ->
  (ensure_elements parent.children (x.name or x.type)) or if parent.attr name then parent

create_hooked_field = (n, field, v) ->
  hook_field n, field, create_form_record n, field, v

create_form_attribute_value = (parent, {name, value}) ->
  if not parent.attr name
    parent.attr name, value
    value
  else
    parent.attr name

create_form_attribute = (parent, field) ->
  create_hooked_field field, create_form_attribute_value parent, field

create_form_element = (parent, field) ->
  v = field.value
  if n = get_field_input parent, field
    v = n.text()
  else
    parent.append n = ($ "<#{field.name}>")
    n.text v
  if field.type is "struct"
    create_form_struct n, field
  else
    create_hooked_field n, field, v

create_form_field = (parent, field) ->
  (if field.attr then create_form_attribute else create_form_element) parent, field

create_form = (xml, fields) ->
  create_form_field xml, x for x in fields
