element_or_attribute = (parent, {name, attr ,type, value, schema }) ->
  if attr
    parent.attr name, value or ""
    null
  else
    parent.append n = ($ parent.context.ownerDocument.createElement name).text value
    if type is "struct"
      struct_to_xml n, schema
    else if type is "xschema"
      struct_to_xml n, SCHEMAS[schema]
    n

struct_to_xml = (parent, fields) ->
  element_or_attribute parent, f for f in fields

@generate_xml_from_schema_name = (schema_name, doc) ->
  parent = $ doc.createElement schema_name
  struct_to_xml parent, SCHEMAS[schema_name]
  parent

@generate_xml_from_field = (field, doc) ->
  parent = $ doc.createElement field.name
  struct_to_xml parent, field
  parent
