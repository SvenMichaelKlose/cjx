identity = (x) -> x

@widget = (name, field, value, xml) ->
  unless WIDGETS[name]
    alert "No widget for type '" + name + "' in '" + field.name + "'."
    debugger
  ((field and field.filter) or identity) WIDGETS[name] field, value, xml
