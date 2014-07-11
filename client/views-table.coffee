root = this

fieldview = ->
  if is_record_type field.type
    td().append render_field(),
                measure()

record = ->
  (tr().addClass "record").append root.record_selector(),
                                  root.render_record(),
                                  root.button_edit(),
                                  root.button_remove()

list_headers = ->
  (th().text desc) for {desc} in SCHEMAS[schema]

record_table = ->
  return xreflist_empty() if records.length is 0
  table().append (thead().append tr().append th(), list_headers()),
                 tbody().append render_list()

list = ->
  [(h1().text desc),
   root.list_selector(),
   root.button_add(),
   record_table()]

get_selected_records = (containment) ->
  containment.find ".record_selector:checked"

@get_selected_record_names = (containment) ->
  (($ x).attr "name" for x in get_selected_records containment)

record_selector = ->
  $ "<input>"
    class: "record_selector"
    type:  "checkbox"
    name:  xml.children().first().text()

list_selector = ->
  b = button()
  set = (to) ->
    ((b.closest ".containment").find ".record_selector").prop "checked", to
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

open_record = (xml, schema) ->
  menu_open ->
    ($ ".arena").append f = form()
    f.append with_mixin [{xml: xml, schema: schema},
                         VIEWS_RECORD, VIEWS_RECORD_EDIT],
                        render_record

create_record = (parent, schema) ->
  record = generate_xml_from_schema schema
  parent.prepend record
  record

add_button = (options) ->
  do (parent, schema) ->
    (button().text "Neu").click (x) ->
      x.preventDefault()
      open_record (create_record parent, schema), schema

edit_button = ->
  do (xml, schema) ->
    (button().text "bearbeiten").click (x) ->
      x.preventDefault()
      open_record xml, schema

remove_button = ->
  do (xml) ->
    (button().text "entfernen").click (x) ->
      x.preventDefault()
      e = ($ x.target).closest ".record"
      e.addClass "selected"
      if confirm "Diesen Eintrag wirklich entfernen?"
        xml = (xml.data "referencing_xml") || xml
        xml.remove()
        e.remove()
      e.removeClass "selected"

@VIEWS_TABLE =
  fieldview:       fieldview
  record:          record
  list:            list
  struct:          -> null
  list_selector:   -> null
  record_selector: -> null
  button_add:      -> null
  button_edit:     -> null
  button_remove:   -> null

@VIEWS_TABLE_EDIT =
  record_selector: record_selector
  list_selector:   list_selector
  button_add:      add_button
  button_edit:     edit_button
  button_remove:   remove_button
