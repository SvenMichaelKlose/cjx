xml_node_of_field = (parent, field) ->
  (ensure_element parent.children field.name) or if parent.attr name then parent

render_record_field = (options, parent, field) ->
  if field.attr
    parent.attr name, v = parent.attr name or value
    render "record", field, v, parent, options
  else
    n = xml_node_of_field parent, field
    debugger if not n
    v = n.text()
    render "record", field, v, n, options

@render_record = (xml, fields, options) ->
  render_record_field options, xml, field for field in fields
