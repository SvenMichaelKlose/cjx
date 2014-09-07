elementOrAttribute = (parent, {name, attr ,type, value, schema }) ->
  if attr
    parent.attr name, value or ""
    null
  else
    parent.append n = ($ parent.context.ownerDocument.createElement name).text value
    if type is "struct"
      structToXML n, schema
    else if type is "xschema"
      structToXML n, SCHEMAS[schema]
    n

structToXML = (parent, fields) ->
  elementOrAttribute parent, f for f in fields

@generateXMLFromSchemaName = (schemaName, doc) ->
  parent = $ doc.createElement schemaName
  structToXML parent, SCHEMAS[schemaName]
  parent

@generateXMLFromField = (field, doc) ->
  parent = $ doc.createElement field.name
  structToXML parent, field
  parent
