root = @
VIEWS = {}

@render_field = ->
  f = expand_type field
  with_mixin {field: f}, root[f.type]

@render_list = ->
  (with_mixin {xml: ($ xml)}, record for xml in records)
