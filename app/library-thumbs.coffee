file = (x) ->
  src = x.attr "src"
  i = figure().append (img().attr {src: src, width: "10%"}),
                      figcaption().text path_filename src
  i.click do (xml) -> (x) ->
    x.preventDefault()
    xml.attr "src", src
    menu_reopen()

@library_thumbs = ->
  file ($ x) for x in RECORDS["library"].children()
