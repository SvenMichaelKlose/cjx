@widget = (name, field, value, xml) ->
  unless WIDGETS[name]
    alert "No widget for type '" + name + "' in '" + field.name + "'."
    debugger
  WIDGETS[name] field, value, xml
