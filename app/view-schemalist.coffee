heading_module = (name) ->
  h2().text MODULES[name].name

@schemalist_item = (x) ->
  name = (x.prop "tagName").toLowerCase()
  (div().addClass "record").append_nested (heading_module name),
                                          with_mixin
                                            schema: SCHEMAS[name]
                                            xml:    x
                                            -> [
                                              button_remove()
                                              render_record()
                                            ]

@schemalist = ->
  schemalist_item ($ x) for x in records
