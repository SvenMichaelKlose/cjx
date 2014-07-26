@XMLDOCS = {}

@set_xml_doc = (name, xmldoc) ->
  XMLDOCS[name] = $ xmldoc

@init_xml_doc = (name) ->
  set_xml_doc name, $.parseXML "<#{name}/>"

@xml_root = (name) ->
  XMLDOCS[name].children 0
