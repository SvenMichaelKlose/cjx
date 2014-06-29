identity = (x) -> x

@widget = (name, field, value, xml) ->
  alert "No widget for type '" + name + "' in '" + field.name + "'." unless WIDGETS[name]
  (field.filter or identity) WIDGETS[name] field, value, xml
