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

xreflist = (options, xml, field) ->
  opt = $.extend {}, options
  opt.records = field.records
  opt.schema = field.schema
  opt.desc = field.desc
  render_list opt, get_xrefs xml, field

@VIEWS_XREF =
  xreflist_empty: xreflist_empty
  xreflist:       xreflist
