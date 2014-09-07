root = @

open_record = (xml, schema) ->
  page_call ->
    with_mixin [
      VIEWS_RECORD
      VIEWS_RECORD_EDIT
      xml:    xml
      schema: schema
    ], -> [
      render_record(),
      button_page_back()
    ]

create_record = (parent, schema, schema_name) ->
  doc = xml_document parent
  parent.prepend if schema?
                   generate_xml_from_field schema, doc
                 else
                   generate_xml_from_schema_name schema_name, doc

add_button = () ->
  do (parent, schema) ->
    (button().text "New").click (x) ->
      x.preventDefault()
      create_record parent, schema, schema_name
      page_reopen()

edit_button = ->
  do (xml, schema) ->
    (button().text "Edit").click (x) ->
      x.preventDefault()
      open_record xml, schema

@button_remove = ->
  do (xml) ->
    (button().text "Remove").click (x) ->
      x.preventDefault()
      e = ($ x.target).closest ".record"
      e.addClass "selected"
      if confirm "Do you really want to remove this record?"
        xml = (xml.data "referencing_xml") || xml
        xml.remove()
        page_reopen()
      e.removeClass "selected"

@VIEWS_LIST_EDIT =
  button_add:   add_button
  button_edit:  edit_button
