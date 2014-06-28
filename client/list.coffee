@open_record = (record, schema) ->
  menu_slide ->
   ($ "form").append magic_button(),
                     create_form record, SCHEMAS[schema]

create_xml_record = (records, schema) ->
  ($ records).first().parent().prepend generate_xml_from_schema schema

add_button = (records, schema) ->
  (button().text "Neu").click (x) ->
    create_xml_record records, schema
    open_record ($ records).first(), schema
    x.preventDefault()

edit_button = (record, schema) ->
  (button().text "bearbeiten").click (x) ->
    open_record record, schema
    x.preventDefault()

remove_button = (record, schema) ->
  (button().text "entfernen").click (x) ->
    e = ($ x.target).closest ".record"
    e.addClass "selected"
    if confirm "Diesen Eintrag wirklich entfernen?"
      records = record.parent
      record.remove()
      e.remove()
    e.removeClass "selected"
    x.preventDefault()

record = (x, schema) ->
  x = $ x
  (tr().addClass "record").append (create_form x, SCHEMAS[schema]),
                                  (edit_button x, schema),
                                  (remove_button x, schema)

list_headers = (schema) ->
  (th().text desc) for {desc} in SCHEMAS[schema]

list = (records, schema) ->
  $.map ($ records), (x) -> record x, schema

make_table = (records, schema) ->
  table().append (thead tr list_headers schema),
                 (tbody list records, schema)

@make_form = (records, schema) ->
    old_widgets = $.extend {}, WIDGETS
    $.extend WIDGETS, LIST_WIDGETS
    ($ ".arena form").empty().append (add_button records, schema),
                                     make_table records, schema
    @WIDGETS = old_widgets
