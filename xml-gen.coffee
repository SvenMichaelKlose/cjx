###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

generate_element_or_attribute = (parent, {name, attr ,type, value, data }) ->
  if attr
    parent.attr name, value
    null
  else
    n = ($ "<#{name}>").text value
    struct_to_xml n, data if type is "struct"
    n

struct_to_xml = (parent, fields) ->
  parent.append (generate_element_or_attribute parent, field for field in fields)

generate_xml_from_schema = (schema_name) ->
  struct_to_xml ($ "<#{schema_name}>"), SCHEMAS[schema_name]
