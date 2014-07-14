@schemalist_item = (x) ->
  name = (x.prop "tagName").toLowerCase()
  div().append_nested (h2().text MODULES[name].name),
                      with_mixin
                        schema: SCHEMAS[name]
                        xml:    x
                        render_record

@schemalist = ->
  schemalist_item ($ x) for x in records

@file = -> div().text "FILE"
