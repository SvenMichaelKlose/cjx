render_field = () ->
  if field.attr
    v = xml.attr name
  else
    x = xml.children field.name
    v = x.text()
  with_mixin {xml: x, value: v}, fieldview

@render_record = () ->
  r = []
  for f in SCHEMAS[schema]
    with_mixin {field: f}, ->
      x = render_field()
      if $.isArray x
        r = $.merge r, x
      else
        r.push x
  r
