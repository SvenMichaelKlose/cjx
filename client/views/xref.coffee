xreflist = ->
  withMixin
    records:     getReferencedRecords xml, field
    schema:      SCHEMAS[field.schema]
    schemaName:  null
    desc:        field.desc
    tableview

@VIEWS_XREF =
  xreflist: xreflist
