get_selected_records = (containment) ->
  containment.find ".record_selector:checked"

@get_selected_record_names = (containment) ->
  (($ x).attr "name" for x in get_selected_records containment)

record = (options, xml) ->
  xml = $ xml
  (tr().addClass "record").append (render "record_selector", null, null, xml, options),
                                  (render_record xml, SCHEMAS[options.schema], options),
                                  (render "button_edit", null, null, xml, options),
                                  (render "button_remove", null, null, xml, options)

list = (options, records) ->
  record options, x for x in records

list_headers = (options) ->
  (th().text desc) for {desc} in SCHEMAS[options.schema]

record_table = (options, records) ->
  if records.length is 0
    render "xreflist_empty"
  else
    head = thead().append tr().append th(), list_headers options
    table().append head, (tbody().addClass "record_list").append list options, records

@render_table = (options, records) ->
  with_views [VIEWS_RECORD, VIEWS_RECORD_DISPLAY, VIEWS_TABLE, VIEWS_TABLE_EDIT], ->
    options.containment.append (h1().text options.desc),
                               (render "list_selector", null, null, null, options if records.length > 1),
                               (render "button_add", null, null, null, options)
                               (record_table options, records)
