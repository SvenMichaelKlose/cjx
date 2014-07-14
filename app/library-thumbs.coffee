file = (x) ->
  src = x.attr "src"
  i = img().attr {src: src, width: "10%"}
  i.click do (xml) -> (x) ->
    x.preventDefault()
    xml.attr "src", src
    menu_reopen()

@library_thumbs = ->
  file ($ x) for x in RECORDS["library"].children()
