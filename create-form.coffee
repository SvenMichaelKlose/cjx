###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

field_label = (field) ->
  ($ "<label for=\"#{field.name}\">").text field.desc + ":"

create_form_record = (xml, field, value) ->
  ($ "<div class='field'>").append (field_label field),
                                   (create_input field, value),
                                   (($ "<span>").text m) if m = (extend_field_type field).measure,

create_form_struct = (xml, field) ->
  div = $ "<div class='struct'>"
  div.append (($ "<h2>").text field.desc),
             create_form xml, field.data

get_field_input = (parent, x) ->
  if e = (parent.children (x.name or x.type))
    if e.length
      e
  else if parent.attr name
         parent

hook_field = (n, field, elm) ->
  h = (x) ->
        v = ($ x.target).val()
        if field.attr
          n.attr (field_name field), v
        else
          n.text v
  elm.change h
  elm.blur h

create_hooked_field = (n, field, v) ->
  hook_field n, field, create_form_record n, field, v

create_form_attribute_value = (parent, field) ->
  name = field_name field
  if not parent.attr name
    parent.attr name, field.value
    field.value
  else
    parent.attr name

create_form_attribute = (parent, field) ->
  create_hooked_field parent, field, create_form_attribute_value parent, field

create_form_element = (parent, field) ->
  v = field.value
  if n = get_field_input parent, field
    v = n.text()
  else
    parent.append n = ($ "<#{field_name field}>")
    n.text v
  if field.type is "struct"
    create_form_struct n, field
  else
    create_hooked_field n, field, v

create_form_field = (parent, field) ->
  if field.attr
    create_form_attribute parent, field
  else
    create_form_element parent, field

create_form = (xml, fields) ->
  create_form_field xml, x for x in fields
