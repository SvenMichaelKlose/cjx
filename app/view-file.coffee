@file = ->
  i = img().attr {src: (xml.attr "src"), width: "30%"}
  b = button().text "Wählen…"
  t = (div().addClass "thumbs").append_nested library_thumbs()
  t.hide()
  b.click (x) ->
    x.preventDefault()
    t.toggle()
  [i, b, t]
