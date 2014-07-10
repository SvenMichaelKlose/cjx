xref_selector = (xml, field) ->
  "#{field.id_field}:contains('#{xml.attr "name"}')"

@get_referenced_record = (xml, field) ->
  (RECORDS[field.records].find xref_selector xml, field).parent()

@get_referenced_records = (xml, field) ->
  for xref in xml.children()
    x = get_referenced_record ($ xref), field
    x.data "referencing_xml", xref
    x
