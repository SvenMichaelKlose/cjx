server_path = (name) -> "/pi/" + ID_CLIENT + "/" + name

outerHTML = (x) ->
  (div().append x.clone()).html()

@post_file = (xml, name) ->
  xhr = $.post (server_path name), x: outerHTML RECORDS[name], name
  xhr.done (data, status) ->
    null   # Mark record as being transmitted.
  xhr.fail (data, status) ->
    alert "Couldn't post #{name}: #{status}"
    debugger

@post_records = ->
  post_file xml, name for name, xml of RECORDS

set_xml = (xml, name, data) ->
  xml.replaceWith RECORDS[name] = data

@get_file = (xml, name) ->
  xhr = $.ajax
    type:     "GET"
    async:    false
    url:      (server_path name)
    dataType: "html"
    success:  (data, status) ->
                set_xml xml, name, ($ data).first()

@get_records = (names) ->
  get_file RECORDS[name], name for name in names
