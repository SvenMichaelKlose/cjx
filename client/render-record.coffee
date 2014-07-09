render_field = (options, xml, field) ->
  if field.attr
    value = xml.attr name
  else
    xml = xml.children field.name
    value = xml.text()
  render "field", options, xml, field, value

@render_record = (options, xml, fields) ->
  r = []
  for field in fields
    x = render_field options, xml, field
    if $.isArray x
      r = $.merge r, x
    else
      r.push x
  r
