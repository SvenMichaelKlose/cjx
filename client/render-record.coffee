xml_node_of_field = (parent, field) ->
  (ensure_element parent.children field.name) or if parent.attr name then parent

render_record_field = (options, xml, field) ->
  if field.attr
    value = xml.attr name
  else
    (xml = xml_node_of_field xml, field) or debugger
    value = xml.text()
  render "record", options, xml, field, value

@render_record = (options, xml, fields) ->
  render_record_field options, xml, field for field in fields
