@open_record = (options, record) ->
  menu_slide ->
    ($ ".arena").append form().addClass "defaultform"
    ($ ".defaultform").append create_form record, SCHEMAS[options.schema]

create_record = (options) ->
  options.parent.prepend generate_xml_from_schema options.schema

add_button = (options) ->
  (button().text "Neu").click (x) ->
    create_record options
    open_record options, options.parent.children().first()
    x.preventDefault()

edit_button = (options, record) ->
  (button().text "bearbeiten").click (x) ->
    open_record options, record
    x.preventDefault()

remove_button = (record) ->
  (button().text "entfernen").click (x) ->
    e = ($ x.target).closest ".record"
    e.addClass "selected"
    if confirm "Diesen Eintrag wirklich entfernen?"
      record.remove()
      e.remove()
    e.removeClass "selected"
    x.preventDefault()

record = (options, x) ->
  x = $ x
  (tr().addClass "record").append (create_form x, SCHEMAS[options.schema]),
                                  (edit_button options, x)
                                  (remove_button x)

list = (options) ->
  $.map options.parent.children(), (x) -> record options, x

list_headers = (options) ->
  (th().text desc) for {desc} in SCHEMAS[options.schema]

make_table = (options) ->
  table().append (thead tr list_headers options),
                 (tbody list options)

@make_form = (options) ->
  old_widgets = $.extend {}, WIDGETS
  $.extend WIDGETS, LIST_WIDGETS
  options.containment.empty().append (h1().text options.desc),
                                     (add_button options),
                                     (make_table options)
  @WIDGETS = old_widgets
