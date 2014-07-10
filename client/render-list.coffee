record = () ->
  (tr().addClass "record").append record_selector(),
                                  render_record(),
                                  button_edit(),
                                  button_remove()

list = () ->
  with_mixin {xml: ($ xml)}, record for xml in records

list_headers = () ->
  (th().text desc) for {desc} in SCHEMAS[schema]

record_table = () ->
  if records.length is 0
    return xreflist_empty()
  head = thead().append tr().append th(), list_headers()
  body = tbody().addClass "record_list"
  table().append head, body.append list()

@render_list = () ->
  with_mixin [VIEWS_TABLE, VIEWS_TABLE_EDIT], ->
    [(h1().text desc),
     list_selector(),
     button_add(),
     record_table()]
