struct_div = -> (div().addClass "struct")

struct = (options, xml, {desc, data}) ->
  struct_div().append (($ "<h2>").text desc),
                      (render_record options, xml, data)

record_div = -> (div().addClass "field")

@is_record_type = (x) -> ($.inArray x, ["struct", "xreflist"]) is -1

field = (options, xml, field, value) ->
  if is_record_type field.type
    record_div().append (render "label", options, xml, field, value),
                        (hook_field xml, field, render_field options, xml, field, value),
                        (render "measure", options, xml, field, value)
  else
    render field.type, options, xml, field, value

xreflist_empty = -> "Leer."

xref_selector = (xml, field) ->
  "#{field.id_field}:contains('#{xml.attr "name"}')"

get_xref = (xml, field) ->
  (RECORDS[field.records].find xref_selector xml, field).parent()

get_xrefs = (xml, field) ->
  (get_xref ($ x), field) for x in xml.children()

xreflist = (options, xml, field) ->
  opt = $.extend {}, options
  opt.records = field.records
  opt.schema = field.schema
  opt.desc = field.desc
  render_table opt, get_xrefs xml, field

@VIEWS_LIST =
  field:          field
  struct:         struct
  xreflist:       xreflist
  xreflist_empty: xreflist_empty
