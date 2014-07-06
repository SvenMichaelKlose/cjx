server_path = (name) -> "/pi/" + ID_CLIENT + "/" + name

outerHTML = (x, name) ->
  "<#{name}>#{x.innerHTML or ""}</#{name}>"

@post_file = (xml, name) ->
  xhr = $.post (server_path name), x: outerHTML RECORDS[name], name
  xhr.done (data, status) -> null   # Mark record as being transmitted.
  xhr.fail (data, status) ->
    alert "Couldn't post #{name}: #{status}"
    debugger

@post_records = ->
  post_file xml, name for name, xml of RECORDS
