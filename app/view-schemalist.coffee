@schemalist_item = (x) ->
  name = (x.prop "tagName").toLowerCase()
  (div().addClass "record").append_nested (h2().text MODULES[name].name),
                                          with_mixin
                                            schema: SCHEMAS[name]
                                            xml:    x
                                            -> [
                                              button_remove()
                                              render_record()
                                            ]

@schemalist = ->
  schemalist_item ($ x) for x in records

@file = -> div().text "FILE"
