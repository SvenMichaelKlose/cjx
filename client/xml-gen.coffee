element_or_attribute = (parent, {name, attr ,type, value, data }) ->
  if attr
    parent.attr name, value
    null
  else
    parent.append n = ($ "<#{name}>").text value
    if type is "struct"
      struct_to_xml n, data
    n

struct_to_xml = (parent, fields) ->
  element_or_attribute parent, f for f in fields

@generate_xml_from_schema = (schema_name) ->
  parent = ($ "<#{schema_name}>")
  struct_to_xml parent, SCHEMAS[schema_name]
  parent
