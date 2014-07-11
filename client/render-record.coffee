@ignore = []

@record_is_ignored = (name) ->
  ($.inArray name, ignore) isnt -1

render_field = ->
  if field.attr
    v = xml.attr name
  else
    x = xml.children field.name
    v = x.text()
  with_mixin {xml: x, value: v}, fieldview

@render_record = ->
  for f in SCHEMAS[schema]
    if not record_is_ignored f.name
      with_mixin {field: f}, render_field
