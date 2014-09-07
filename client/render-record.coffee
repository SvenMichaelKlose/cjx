@ignore = []

@recordIsIgnored = (name) ->
  ($.inArray name, ignore) isnt -1

renderField = ->
  if field.attr
    x = xml
    v = xml.attr field.name
  else
    x = xml.children field.name
    v = x.text()
  withMixin {parent: xml, xml: x, value: v}, fieldview

@renderFields = ->
  for f in schema
    if not recordIsIgnored f.name
      withMixin {field: f}, -> tr().append renderField()

@renderRecord = ->
  (table().addClass schemaName).append tbody().append renderFields()
