get_selected_records = (containment) ->
  containment.find ".record_selector:checked"

@get_selected_record_names = (containment) ->
  (($ x).attr "name" for x in get_selected_records containment)

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
    render "xreflist_empty", options
  else
    head = thead().append tr().append th(), list_headers options
    body = tbody().addClass "record_list")
    table().append head, body.append list options, records

@render_list = (options, records) ->
  with_views [VIEWS_TABLE, VIEWS_TABLE_EDIT], ->
    options.containment.append (h1().text options.desc),
                               (render "list_selector", options, records),
                               (render "button_add", options, records),
                               (record_table options, records)
