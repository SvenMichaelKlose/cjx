xreflist_empty = -> "Leer."

xref_selector = (xml, field) ->
  "#{field.id_field}:contains('#{xml.attr "name"}')"

get_xref = (xml, field) ->
  (RECORDS[field.records].find xref_selector xml, field).parent()

get_xrefs = (xml, field) ->
  for xref in xml.children()
    x = get_xref ($ xref), field
    x.data "referencing_xml", xref
    x

xreflist = () ->
  with_mixin
    records: (get_xrefs xml, field)
    schema:  field.schema
    desc:    field.desc
    render_list

@VIEWS_XREF =
  xreflist_empty: xreflist_empty
  xreflist:       xreflist
