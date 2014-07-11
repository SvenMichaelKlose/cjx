xreflist = ->
  with_mixin
    records: (get_referenced_records xml, field)
    schema:  field.schema
    desc:    field.desc
    list

@VIEWS_XREF =
  xreflist:       xreflist
