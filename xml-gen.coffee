###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

generate_element_or_attribute = (parent, field) ->
  name = field.name or field.type
  if field.attr
    parent.attr name, field.value
    null
  else
      n = ($ "<#{name}>").text field.value
      if field.type is "struct"
         struct_to_xml n, field.data
      n

struct_to_xml = (parent, fields) ->
  parent.append (generate_element_or_attribute parent, field for field in fields)

generate_xml_from_schema = (schema_name) ->
  struct_to_xml ($ "<#{schema_name}>"), SCHEMAS[schema_name]
