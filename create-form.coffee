###                                                                                                            
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

field_label = (field) ->
  ($ "<label for=\"#{field.name}\">").text field.desc + ":"

create_form_struct = (field) ->
  div = $ "<div class='struct'>"
  div.append (($ "<h2>").text field.desc),
             create_form field.data

create_form_record = (field) ->
  ($ "<div class='field'>").append (field_label field),
                                   (create_input field),
                                   (($ "<span>").text m) if m = (extend_field_type field).measure,

create_form_field = (field) ->
  if field.type is "struct"
    create_form_struct field
  else
    create_form_record field

create_form = (fields) ->
  create_form_field x for x in fields
