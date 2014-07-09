struct_div = -> (div().addClass "struct")

struct = ({desc, data}, value, xml) ->
  struct_div().append (($ "<h2>").text desc),
                      (render_record xml, data)

record_div = -> (div().addClass "field")

@is_record_type = (x) -> ($.inArray x, ["struct", "xreflist"]) is -1

record = (field, value, xml, options) ->
  if is_record_type field.type
    f = expand_type field
    record_div().append (render "label", field, value, xml, options),
                        (hook_field xml, field, render f.type, f, value, xml, options),
                        (render "measure", field, value, xml, options)
  else
    render field.type, field, value, xml, options

xreflist_empty = (field, value, xml) ->
  "Leer."

xref_selector = (field, xml) ->
  "#{field.id_field}:contains('#{xml.attr "name"}')"

get_xref = (field, xml) ->
  (RECORDS[field.records].find xref_selector field, xml).parent()

get_xrefs = (field, xml) ->
  get_xref field, $ x for x in xml.children()

xreflist = (field, value, xml, options) ->
  opt = $.extend {}, options
  opt.records = field.records
  opt.schema = field.schema
  opt.desc = field.desc
  (render_table opt, get_xrefs field, xml)

@VIEWS_LIST =
  record:         record
  struct:         struct
  xreflist:       xreflist
  xreflist_empty: xreflist_empty
