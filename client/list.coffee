@open_record = (options, record) ->
  menu_slide ->
    ($ ".arena").append form().addClass "defaultform"
    ($ ".defaultform").append render_record record, SCHEMAS[options.schema]

create_record = (options) ->
  record = generate_xml_from_schema options.schema
  options.parent.prepend record
  record

add_button = (options) ->
  (button().text "Neu").click (x) ->
    x.preventDefault()
    open_record options, create_record options

edit_button = (options, record) ->
  (button().text "bearbeiten").click (x) ->
    x.preventDefault()
    open_record options, record

remove_button = (record) ->
  (button().text "entfernen").click (x) ->
    x.preventDefault()
    e = ($ x.target).closest ".record"
    e.addClass "selected"
    if confirm "Diesen Eintrag wirklich entfernen?"
      record.remove()
      e.remove()
    e.removeClass "selected"

record = (options, x) ->
  x = $ x
  cb = $ "<input>"
         class: "record_selector"
         type:  "checkbox"
         name:  x.children().first().text()
  (tr().addClass "record").append cb,
                                  (render_record x, SCHEMAS[options.schema], options),
                                  (edit_button options, x) if options.can_edit,
                                  (remove_button x)

list = (options, records) ->
  record options, x for x in records

list_headers = (options) ->
  (th().text desc) for {desc} in SCHEMAS[options.schema]

record_table = (options, records) ->
  if records.length is 0
    widget "xreflist_empty"
  else
    head = thead().append tr().append th(),
                                      list_headers options
    table().append head,
                   (tbody list options, records)

@render_list = (options, records) ->
  old_widgets = $.extend {}, WIDGETS
  $.extend WIDGETS, LIST_WIDGETS
  options.containment.append (h1().text options.desc),
                             (add_button options) if options.can_create,
                             (record_table options, records),
                             (list_selecting_button options.containment)
  @WIDGETS = old_widgets
