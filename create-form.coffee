###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

field_label = (field) ->
  ($ "<label for=\"#{field.name}\">").text field.desc + ":"

create_form_record = (xml, field) ->
  ($ "<div class='field'>").append (field_label field),
                                   (create_input field),
                                   (($ "<span>").text m) if m = (extend_field_type field).measure,

create_form_struct = (xml, field) ->
  div = $ "<div class='struct'>"
  div.append (($ "<h2>").text field.desc),
             create_form xml, field.data

get_field_input = (parent, x) ->
  (parent.children (x.name or x.type)) or parent if parent.attr name

hook_field = (n, field, elm) ->
  elm.change (x) ->
               v = ($ x.target).val()
               if field.attr
                 n.attr v
               else
                 n.text v

create_form_field = (parent, field) ->
  name = field.name or field.type
  if field.attr
    n = parent
    n.attr name, field.value
  else
    (n = get_field_input parent, field) or parent.append (n = ($ "<#{name}>"))
  hook_field n, field, if field.type is "struct"
                         create_form_struct n, field
                       else
                         create_form_record n, field

create_form = (xml, fields) ->
  create_form_field xml, x for x in fields
