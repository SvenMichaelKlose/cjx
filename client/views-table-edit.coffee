record_selector = (field, value, xml, options) ->
  $ "<input>"
    class: "record_selector"
    type:  "checkbox"
    name:  xml.children().first().text()

list_selector = (field, value, xml, options) ->
  b = button()
  set = (to) ->
    (options.containment.find ".record_selector").prop "checked", to
  select_on_click = ->
    (b.text "Alle auswählen").click (x) ->
      x.preventDefault()
      unselect_on_click()
      set true
  unselect_on_click = ->
    (b.text "Alle abwählen").click (x) ->
      x.preventDefault()
      select_on_click()
      set false
  select_on_click()
  b

open_record = (options, record) ->
  menu_slide ->
    ($ ".arena").append form().addClass "defaultform"
    with_views [VIEWS_RECORD, VIEWS_RECORD_EDIT, VIEWS_LIST], ->
      ($ ".defaultform").append render_record record, SCHEMAS[options.schema]

create_record = (options) ->
  record = generate_xml_from_schema options.schema
  options.parent.prepend record
  record

add_button = (field, value, xml, options) ->
  (button().text "Neu").click (x) ->
    x.preventDefault()
    open_record options, create_record options

edit_button = (field, value, xml, options) ->
  if not options.schema
    debugger
  (button().text "bearbeiten").click (x) ->
    x.preventDefault()
    open_record options, xml

remove_button = (field, value, xml, options) ->
  (button().text "entfernen").click (x) ->
    x.preventDefault()
    e = ($ x.target).closest ".record"
    e.addClass "selected"
    if confirm "Diesen Eintrag wirklich entfernen?"
      xml.remove()
      e.remove()
    e.removeClass "selected"

@VIEWS_TABLE_EDIT =
  record_selector: record_selector
  list_selector:   list_selector
  button_add:      add_button
  button_edit:     edit_button
  button_remove:   remove_button
