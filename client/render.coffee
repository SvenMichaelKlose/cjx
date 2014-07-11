VIEWS = {}

@render_field = ->
  with_mixin {field: expand_type field}, @[field.type]

@render_list = ->
  ensure_element_array (with_mixin {xml: ($ xml)}, record for xml in records)
