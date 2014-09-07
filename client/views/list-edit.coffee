root = @

open_record = (xml, schema) ->
  menu_open ->
    ($ ".arena").append f = form()
    f.append_nested with_mixin [
                      VIEWS_RECORD
                      VIEWS_RECORD_EDIT
                      xml:    xml
                      schema: schema
                    ], render_record

create_record = (parent, schema, schema_name) ->
  doc = xml_document parent
  parent.prepend if schema?
                   generate_xml_from_field schema, doc
                 else
                   generate_xml_from_schema_name schema_name, doc

add_button = () ->
  do (parent, schema) ->
    (button().text "Neu").click (x) ->
      x.preventDefault()
      create_record parent, schema, schema_name
      menu_reopen()

edit_button = ->
  do (xml, schema) ->
    (button().text "bearbeiten").click (x) ->
      x.preventDefault()
      open_record xml, schema

@button_remove = ->
  do (xml) ->
    (button().text "entfernen").click (x) ->
      x.preventDefault()
      e = ($ x.target).closest ".record"
      e.addClass "selected"
      if confirm "Diesen Eintrag wirklich entfernen?"
        xml = (xml.data "referencing_xml") || xml
        xml.remove()
        menu_reopen()
      e.removeClass "selected"

@VIEWS_LIST_EDIT =
  button_add:   add_button
  button_edit:  edit_button