@schemalist_item = (x) ->
  with_mixin
    schema: SCHEMAS[(x.prop "tagName").toLowerCase()]
    xml:    x
    render_record

@schemalist = ->
  schemalist_item ($ x) for x in records

@file = -> div().text "FILE"
