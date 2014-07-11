render_field = () ->
  if field.attr
    v = xml.attr name
  else
    x = xml.children field.name
    v = x.text()
  with_mixin {xml: x, value: v}, fieldview

@render_record = () ->
  ensure_element_array (with_mixin {field: f}, render_field for f in SCHEMAS[schema])
