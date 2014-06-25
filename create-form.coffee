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
  if field.type is "struct"
    elm
  else
    elm.change (x) ->
                 v = ($ x.target).val()
                 if field.attr
                   n.attr (field_name field), v
                 else
                   n.text v

create_form_field = (parent, field) ->
  name = field.name or field.type
  v = field.value
  if field.attr
    n = parent
    if not n.attr name
      n.attr name, field.value
    else
      v = n.attr name
  else
    if not n = get_field_input parent, field
      parent.append n = ($ "<#{name}>")
      n.text v
  hook_field n, field, if field.type is "struct"
                         create_form_struct n, field
                       else
                         create_form_record n, field, v

create_form = (xml, fields) ->
  create_form_field xml, x for x in fields
