VIEWS = {}

@render_field = ->
  with_mixin {field: expand_type field}, @[field.type]

@render_list = ->
  (with_mixin {xml: ($ xml)}, record for xml in records)
