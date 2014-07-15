xreflist = ->
  with_mixin
    records: (get_referenced_records xml, field)
    schema:  SCHEMAS[field.schema]
    desc:    field.desc
    tableview

@VIEWS_XREF =
  xreflist:       xreflist
