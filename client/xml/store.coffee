serverPath = (name) -> SERVER_PATH + "/" + ID_CLIENT + "/" + name

outerHTML = (x) ->
  (div().append x.clone()).html()

@saveDocument = (name) ->
  serializer = new XMLSerializer()
  xmlstr = serializer.serializeToString XMLDOCS[name]
  xhr = $.post (serverPath name), x: xmlstr, name
  xhr.done (data, status) ->
    null   # Mark record as being transmitted.
  xhr.fail (data, status) ->
    alert "Couldn't post #{name}: #{status}"
    debugger

@saveDocuments = ->
  saveDocument name for name of XMLDOCS

@loadDocument = (name) ->
  xhr = $.ajax
    type:     "GET"
    async:    false
    url:      (serverPath name)
    dataType: "xml"
    success:  (data, status) ->
                setXMLDocument name, data

@loadDocuments = (names) ->
  loadDocument name for name in names
