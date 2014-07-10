VIEWS = {}

@render_field = () ->
  with_mixin {field: expand_type field}, @[field.type]
