xrefSelector = (xml, field) ->
  "#{field.idField}:contains('#{xml.attr "name"}')"

@getReferencedRecord = (xml, field) ->
  ((XMLDocumentRoot field.records).find xrefSelector xml, field).parent()

@getReferencedRecords = (xml, field) ->
  for xref in xml.children()
    x = getReferencedRecord ($ xref), field
    x.data "referencing_xml", xref
    x
