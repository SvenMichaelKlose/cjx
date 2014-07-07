@open_record = (options, record) ->
  menu_slide ->
    ($ ".arena").append form().addClass "defaultform"
    ($ ".defaultform").append create_form record, SCHEMAS[options.schema]

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
  cb = ($ "<input>")
  cb.attr type: "checkbox", name: x.children().first().text()
  (tr().addClass "record").append cb,
                                  (create_form x, SCHEMAS[options.schema]),
                                  (edit_button options, x),
                                  (remove_button x)

list = (options) ->
  $.map options.parent.children(), (x) -> record options, x

list_headers = (options) ->
  (th().text desc) for {desc} in SCHEMAS[options.schema]

make_table = (options) ->
  head = thead().append tr().append th(),
                                    list_headers options
  table().append head,
                 (tbody list options)

@make_form = (options) ->
  old_widgets = $.extend {}, WIDGETS
  $.extend WIDGETS, LIST_WIDGETS
  options.containment.empty().append (h1().text options.desc),
                                     (add_button options),
                                     (make_table options)
  @WIDGETS = old_widgets
