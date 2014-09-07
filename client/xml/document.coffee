@XMLDOCS = {}

@XMLDocument = (x) ->
  x.context.ownerDocument || x.context

@XMLDocumentRoot = (name) ->
  $ ($ XMLDOCS[name]).children 0

@createXMLDocument = (name) ->
  $.parseXML "<#{name}/>"

@setXMLDocument = (name, xmldoc) ->
  XMLDOCS[name] = xmldoc

@initXMLDocument = (name) ->
  setXMLDocument name, createXMLDocument name

@initXMLDocumentFromSchemaName = (name) ->
  initXMLDocument name
  (xml_root name).replaceWith generateXMLFromSchemaName name, XMLDOCS[name]
