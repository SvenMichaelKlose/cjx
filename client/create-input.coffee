###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

create_widget = (constructor, field, value) ->
  e = constructor field, value
  if f = field.filter
    f field, e
  else
    e

create_input = (field, value) ->
  create_widget WIDGETS[field.type], (extend_field_type field), value
