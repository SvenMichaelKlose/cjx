server_path = (name) -> SERVER_PATH + "/" + ID_CLIENT + "/" + name

outerHTML = (x) ->
  (div().append x.clone()).html()

@save_document = (name) ->
  serializer = new XMLSerializer()
  xmlstr = serializer.serializeToString XMLDOCS[name]
  xhr = $.post (server_path name), x: xmlstr, name
  xhr.done (data, status) ->
    null   # Mark record as being transmitted.
  xhr.fail (data, status) ->
    alert "Couldn't post #{name}: #{status}"
    debugger

@save_documents = ->
  save_document name for name of XMLDOCS

@load_document = (name) ->
  xhr = $.ajax
    type:     "GET"
    async:    false
    url:      (server_path name)
    dataType: "xml"
    success:  (data, status) ->
                set_xml_doc name, data

@load_documents = (names) ->
  load_document name for name in names
