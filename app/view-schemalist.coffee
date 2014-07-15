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
  debugger
  schemalist_item ($ x) for x in records

@file = ->
  i = img().attr {src: (xml.attr "src"), width: "30%"}
  b = button().text "Wählen…"
  t = (div().addClass "thumbs").append_nested library_thumbs()
  t.hide()
  b.click (x) ->
    x.preventDefault()
    t.toggle()
  [i, b, t]
