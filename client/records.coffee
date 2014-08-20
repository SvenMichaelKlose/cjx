@XMLDOCS = {}

@xml_document = (x) ->
  x.context.ownerDocument || x.context

@xml_root = (name) ->
  $ ($ XMLDOCS[name]).children 0

@create_xml_document = (name) ->
  $.parseXML "<#{name}/>"

@set_xml_doc = (name, xmldoc) ->
  XMLDOCS[name] = xmldoc

@init_xml_doc = (name) ->
  set_xml_doc name, create_xml_document name

@init_xml_doc_from_schema_name = (name) ->
  init_xml_doc name
  (xml_root name).replaceWith generate_xml_from_schema_name name, XMLDOCS[name]
