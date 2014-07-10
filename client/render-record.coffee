render_field = () ->
  if field.attr
    v = xml.attr name
  else
    x = xml.children field.name
    v = x.text()
  with_mixin {xml: x, value: v}, fieldview

@render_record = (fields) ->
  r = []
  for f in fields
    with_mixin {field: f}, ->
      x = render_field()
      if $.isArray x
        r = $.merge r, x
      else
        r.push x
  r
