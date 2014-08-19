server_path = (name) -> "/pi/" + ID_CLIENT + "/" + name

outerHTML = (x) ->
  (div().append x.clone()).html()

@post_file = (name) ->
  serializer = new XMLSerializer()
  xmlstr = serializer.serializeToString XMLDOCS[name].context
  xhr = $.post (server_path name), x: xmlstr, name
  xhr.done (data, status) ->
    null   # Mark record as being transmitted.
  xhr.fail (data, status) ->
    alert "Couldn't post #{name}: #{status}"
    debugger

@post_records = ->
  post_file name for name of XMLDOCS

@get_file = (name) ->
  xhr = $.ajax
    type:     "GET"
    async:    false
    url:      (server_path name)
    dataType: "xml"
    success:  (data, status) ->
                set_xml_doc name, data

@get_records = (names) ->
  get_file name for name in names
