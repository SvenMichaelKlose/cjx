root = @

openRecord = (xml, schema) ->
  pageCall ->
    withMixin [
      VIEWS_RECORD
      VIEWS_RECORD_EDIT
      xml:    xml
      schema: schema
    ], -> [
      renderRecord(),
      buttonPageBack()
    ]

createRecord = (parent, schema, schemaName) ->
  doc = XMLDocument parent
  parent.prepend if schema?
                   generateXMLFromField schema, doc
                 else
                   generateXMLFromSchemaName schemaName, doc

addButton = () ->
  do (parent, schema) ->
    (button().text "Create").click (x) ->
      x.preventDefault()
      createRecord parent, schema, schemaName
      pageReopen()

editButton = ->
  do (xml, schema) ->
    (button().text "Edit").click (x) ->
      x.preventDefault()
      openRecord xml, schema

@buttonRemove = ->
  do (xml) ->
    (button().text "Remove").click (x) ->
      x.preventDefault()
      e = ($ x.target).closest ".record"
      e.addClass "selected"
      if confirm "Do you really want to remove this record?"
        xml = (xml.data "referencing_xml") || xml
        xml.remove()
        pageReopen()
      e.removeClass "selected"

@VIEWS_LIST_EDIT =
  buttonAdd:   addButton
  buttonEdit:  editButton
