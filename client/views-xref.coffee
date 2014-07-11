xreflist_empty = -> "Leer."

xreflist = () ->
  with_mixin
    records: (get_referenced_records xml, field)
    schema:  field.schema
    desc:    field.desc
    list

@VIEWS_XREF =
  xreflist_empty: xreflist_empty
  xreflist:       xreflist
