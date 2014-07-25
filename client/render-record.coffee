@ignore = []

@record_is_ignored = (name) ->
  ($.inArray name, ignore) isnt -1

#get_child = (x, name) ->
#  name = name.toUpperCase()
#  for child in x.context.children
#    if child.tagName is name
#      return $ child

render_field = ->
  if field.attr
    x = xml
    v = xml.attr field.name
  else
    x = xml.children field.name
    v = x.text()
  with_mixin {parent: xml, xml: x, value: v}, fieldview

@render_fields = ->
  for f in schema
    if not record_is_ignored f.name
      with_mixin {field: f}, -> tr().append_nested render_field()

@render_record = ->
  (table().addClass schema_name).append tbody().append_nested render_fields()
