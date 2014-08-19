root = @

option = (txt, value) ->
  (root.option().text txt).attr value: value

selection = ->
  select().append (option m.name, name for name, m of MODULES)

add = (xml, val) ->
  xml.append generate_xml_from_schema val, xml_document xml
  menu_reopen()

button_add = -> [
  s = selection()
  (b = button().text "hinzufügen").click do (xml) -> (x) ->
    x.preventDefault()
    add xml, s.val()
]

@open_navigation = ->
  xroot = (xml_root "app").find "navigation"
  with_mixin [
      VIEWS_RECORD_EDIT
      VIEWS_LIST_EDIT
      button_edit: null
      schema:  SCHEMAS["navigation"]
      records: xroot.children()
      xml:     xroot
      desc:    "Navigation"
    ], -> [
      button_add()
      schemalist()
    ]
