###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

create_widget = (name, field, value) ->
  e = WIDGETS[name] field, value
  if f = field.filter
    f field, e
  else
    e
