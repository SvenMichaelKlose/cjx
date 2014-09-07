root = @
VIEWS = {}

@renderField = ->
  f = expandType field
  withMixin {field: f}, root[f.type]

@renderList = ->
  withMixin {xml: ($ xml)}, record for xml in records
