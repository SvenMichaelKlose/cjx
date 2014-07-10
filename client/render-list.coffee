record = (options, xml) ->
  (tr().addClass "record").append (render "record_selector", options, xml),
                                  (render_record options, xml, SCHEMAS[options.schema]),
                                  (render "button_edit", options, xml),
                                  (render "button_remove", options, xml)

list = (options, records) ->
  record options, ($ xml) for xml in records

list_headers = (options) ->
  (th().text desc) for {desc} in SCHEMAS[options.schema]

record_table = (options, records) ->
  if records.length is 0
    return render "xreflist_empty", options
  head = thead().append tr().append th(), list_headers options
  body = tbody().addClass "record_list"
  table().append head, body.append list options, records

@render_list = (options, records) ->
  with_views [VIEWS_TABLE, VIEWS_TABLE_EDIT], ->
    [(h1().text options.desc),
     (render "list_selector", options, records),
     (render "button_add", options, records),
     (record_table options, records)]
